import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../viewmodel/prescription_view_model.dart';
import '../model/prescription.dart';
import '../widgets/status_pill.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class PrescriptionScreen extends ConsumerWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prescriptions = ref.watch(prescriptionViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Prescriptions', style: AppTypography.h1),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Prescription'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Expanded(
          child: ListView.separated(
            itemCount: prescriptions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final p = prescriptions[index];
              return _PrescriptionCard(prescription: p);
            },
          ),
        ),
      ],
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  final Prescription prescription;
  const _PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(prescription.medicationName, style: AppTypography.h3),
              StatusPill(status: prescription.status),
            ],
          ),
          const SizedBox(height: 12),
          Text(prescription.dosage, style: AppTypography.bodyLarge),
          const SizedBox(height: 8),
          Text(prescription.instructions, style: AppTypography.bodyMedium),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 1),
          ),
          Row(
            children: [
              _InfoItem(label: 'Provider', value: prescription.providerName),
              const SizedBox(width: 40),
              _InfoItem(label: 'Last filled', value: DateFormat('MMM dd, yyyy').format(prescription.lastFilled)),
              const SizedBox(width: 40),
              _InfoItem(label: 'Refills remaining', value: prescription.refillsRemaining.toString()),
              const Spacer(),
              _ActionButtons(prescription: prescription),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final Prescription prescription;
  const _ActionButtons({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('View history', style: TextStyle(color: AppColors.textSecondary)),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryBlue,
            side: const BorderSide(color: AppColors.primaryBlue),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text('Request refill'),
        ),
      ],
    );
  }
}
