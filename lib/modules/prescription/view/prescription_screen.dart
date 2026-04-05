import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        Text('Prescriptions', style: AppTypography.h2),
        const SizedBox(height: 32),
        _PrescriptionSection(
          title: 'Active prescriptions',
          items: prescriptions.where((p) => p.status == PrescriptionStatus.active).toList(),
        ),
        const SizedBox(height: 48),
        _PrescriptionSection(
          title: 'Refill requests & history',
          items: prescriptions.where((p) => p.status != PrescriptionStatus.active).toList(),
        ),
      ],
    );
  }
}

class _PrescriptionSection extends StatelessWidget {
  final String title;
  final List<Prescription> items;
  const _PrescriptionSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h3),
        const SizedBox(height: 16),
        ...items.map((p) => _PrescriptionCard(prescription: p)),
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
      width: 1091,
      height: 104,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(prescription.drugName, style: AppTypography.contentStyle.copyWith(fontSize: 18)),
                const SizedBox(height: 4),
                Text('${prescription.dosage} - ${prescription.frequency}', style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: StatusPill(status: prescription.status)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${prescription.refillsRemaining} refills left',
              style: AppTypography.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 133,
            height: 40,
            child: ElevatedButton(
              onPressed: prescription.refillsRemaining > 0 ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Request Refill'),
            ),
          ),
        ],
      ),
    );
  }
}
