import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/billing_view_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class BillingScreen extends ConsumerWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final billingData = ref.watch(billingViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Billing', style: AppTypography.h1),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: const Text('Make a Payment'),
            ),
          ],
        ),
        const SizedBox(height: 40),
        
        // Summary Cards
        Row(
          children: [
            _SummaryCard(label: 'Account Balance', value: '\$120.00', color: AppColors.primaryBlue),
            const SizedBox(width: 24),
            _SummaryCard(label: 'Next statement date', value: 'April 20, 2026', color: AppColors.textSecondary),
          ],
        ),
        
        const SizedBox(height: 60),
        Text('Latest Statements', style: AppTypography.h2),
        const SizedBox(height: 24),
        
        // Statements Table
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return _StatementTile(
                  date: 'March 15, 2026',
                  amount: index == 0 ? '\$120.00' : '\$250.00',
                  status: index == 0 ? 'Due' : 'Paid',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryCard({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTypography.bodySmall),
            const SizedBox(height: 12),
            Text(value, style: AppTypography.h1.copyWith(color: color, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}

class _StatementTile extends StatelessWidget {
  final String date;
  final String amount;
  final String status;

  const _StatementTile({required this.date, required this.amount, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(24),
      title: Text(date, style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text('Statement #S12345', style: AppTypography.bodySmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
              Text(status, style: AppTypography.bodySmall.copyWith(color: status == 'Due' ? AppColors.error : AppColors.success)),
            ],
          ),
          const SizedBox(width: 24),
          IconButton(onPressed: () {}, icon: const Icon(Icons.download_outlined)),
        ],
      ),
    );
  }
}
