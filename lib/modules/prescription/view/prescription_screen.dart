import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/prescription_view_model.dart';
import '../model/prescription.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/portal_list_card.dart';

class PrescriptionScreen extends ConsumerWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prescriptions = ref.watch(prescriptionViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Prescriptions', style: AppTypography.pageTitle),
        const SizedBox(height: 32),
        ...prescriptions.map((p) => _PrescriptionCard(prescription: p)),
      ],
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  final Prescription prescription;
  const _PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return PortalListCard(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 16,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  prescription.drugName,
                  style: AppTypography.contentStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 164,
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9ECCD),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${prescription.refillsRemaining} refills remaining',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dosage: ${prescription.dosage} Frequency: ${prescription.frequency}',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Action Buttons from Figma (3 Inactive Buttons placeholders)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _FigmaInactiveButton(),
              _FigmaInactiveButton(),
              _FigmaInactiveButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _FigmaInactiveButton extends StatelessWidget {
  const _FigmaInactiveButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Inactive Button',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

