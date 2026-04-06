import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../viewmodel/billing_view_model.dart';
import '../model/billing_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/portal_list_card.dart';
import '../../../../shared/widgets/navigation/portal_tab_bar.dart';

class BillingScreen extends ConsumerStatefulWidget {
  const BillingScreen({super.key});

  @override
  ConsumerState<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends ConsumerState<BillingScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = const ['Outstanding', 'History', 'Payment'];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(billingViewModelProvider);

    List<Transaction> displayTransactions = [];
    if (_selectedTabIndex == 0) {
      displayTransactions = state.transactions
          .where((t) => t.status != BillingStatus.paid)
          .toList();
    } else if (_selectedTabIndex == 1) {
      displayTransactions = state.transactions
          .where((t) => t.status == BillingStatus.paid)
          .toList();
    }

    // Try to find last payment date
    final paidTx = state.transactions.where((t) => t.status == BillingStatus.paid).toList();
    paidTx.sort((a, b) => b.date.compareTo(a.date));
    final lastPaymentDateStr = paidTx.isNotEmpty
        ? DateFormat('MMMM d, yyyy').format(paidTx.first.date)
        : 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Billing', style: AppTypography.pageTitle),
        const SizedBox(height: 32),
        PortalTabBar(
          tabs: _tabs,
          selectedIndex: _selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        const SizedBox(height: 32),
        // Summary Block
        Wrap(
          spacing: 80,
          runSpacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total outstanding balance:',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${state.outstandingBalance.toStringAsFixed(2)}',
                  style: AppTypography.pageTitle.copyWith(fontSize: 48),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Last payment',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  lastPaymentDateStr,
                  style: AppTypography.h2.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Transaction Cards
        if (_selectedTabIndex == 0 || _selectedTabIndex == 1)
          ...displayTransactions.map((t) => _TransactionCard(transaction: t)),
        if (_selectedTabIndex == 2)
          const Center(child: Text("Payment settings placeholder")),
      ],
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const _TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isOverdue = transaction.status == BillingStatus.outstanding;
    final accentColor = isOverdue ? AppColors.error : Colors.transparent;

    String statusText = "";
    Color statusColor = AppColors.textSecondary;

    switch (transaction.status) {
      case BillingStatus.paid:
        statusText = "Paid";
        statusColor = AppColors.statusActiveText;
        break;
      case BillingStatus.outstanding:
        statusText = "Overdue";
        statusColor = AppColors.error;
        break;
      case BillingStatus.processing:
        statusText = "Pending";
        statusColor = AppColors.statusOnHoldText;
        break;
      case BillingStatus.failed:
        statusText = "Failed";
        statusColor = AppColors.error;
        break;
    }

    return PortalListCard(
      leftAccentColor: accentColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          final leftInfo = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                transaction.description,
                style: AppTypography.contentStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${transaction.amount.toStringAsFixed(0)}',
                style: AppTypography.contentStyle.copyWith(fontSize: 18),
              ),
            ],
          );

          final middleMetadata = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Invoice ID: ${transaction.id}',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                'Due date: ${DateFormat('MMMM d, yyyy').format(transaction.date)}',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Status: ',
                    style: AppTypography.bodySmall,
                  ),
                  Text(
                    statusText,
                    style: AppTypography.bodySmall.copyWith(color: statusColor),
                  ),
                ],
              ),
            ],
          );

          final actionButtons = Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SizedBox(
                width: 120,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                ),
              ),
              if (transaction.status != BillingStatus.paid)
                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pay Now'),
                  ),
                ),
            ],
          );

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftInfo,
                const SizedBox(height: 16),
                middleMetadata,
                const SizedBox(height: 16),
                actionButtons,
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 2, child: leftInfo),
              Expanded(flex: 2, child: middleMetadata),
              actionButtons,
            ],
          );
        },
      ),
    );
  }
}
