import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../viewmodel/billing_view_model.dart';
import '../model/billing_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class BillingScreen extends ConsumerWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(billingViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Billing', style: AppTypography.h2),
        const SizedBox(height: 32),
        _BalanceCard(balance: state.outstandingBalance),
        const SizedBox(height: 48),
        Text('Payment history', style: AppTypography.h3),
        const SizedBox(height: 16),
        _TransactionTable(transactions: state.transactions),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final double balance;
  const _BalanceCard({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 653,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Outstanding balance',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${balance.toStringAsFixed(2)}',
                style: AppTypography.h1.copyWith(
                  fontSize: 32,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTable extends StatelessWidget {
  final List<Transaction> transactions;
  const _TransactionTable({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1091,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: DataTable(
        columnSpacing: 24,
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Description')),
          DataColumn(label: Text('Amount')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Action')),
        ],
        rows: transactions.map((t) {
          return DataRow(
            cells: [
              DataCell(Text(DateFormat('MM/dd/yyyy').format(t.date))),
              DataCell(Text(t.description)),
              DataCell(Text('\$${t.amount.toStringAsFixed(2)}')),
              DataCell(_StatusIndicator(status: t.status)),
              DataCell(
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View Bill',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final BillingStatus status;
  const _StatusIndicator({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case BillingStatus.paid:
        color = AppColors.statusActiveText;
        break;
      case BillingStatus.outstanding:
        color = AppColors.statusStoppedText;
        break;
      case BillingStatus.processing:
        color = AppColors.statusOnHoldText;
        break;
      case BillingStatus.failed:
        color = AppColors.statusStoppedText;
        break;
    }
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          status.name.substring(0, 1).toUpperCase() + status.name.substring(1),
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
