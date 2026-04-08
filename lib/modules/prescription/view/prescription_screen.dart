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

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Prescriptions', style: AppTypography.pageTitle),
          const SizedBox(height: 32),
          ...prescriptions.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _PrescriptionCard(prescription: p),
          )),
        ],
      ),
    );
  }
}

class _PrescriptionCard extends StatelessWidget {
  final Prescription prescription;
  const _PrescriptionCard({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return PortalListCard(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          
          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderSection(prescription: prescription),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(color: AppColors.divider),
                ),
                _DetailsSection(prescription: prescription),
                const SizedBox(height: 24),
                const _ActionSection(),
              ],
            );
          }

          return IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _HeaderSection(prescription: prescription),
                ),
                const VerticalDivider(
                  color: AppColors.divider,
                  thickness: 1,
                  width: 64,
                ),
                Expanded(
                  flex: 2,
                  child: _DetailsSection(prescription: prescription),
                ),
                const SizedBox(width: 32),
                const _ActionSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final Prescription prescription;
  const _HeaderSection({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prescription.drugName,
          style: AppTypography.contentStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFD9ECCD),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Text(
            '${prescription.refillsRemaining} refills remaining',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  final Prescription prescription;
  const _DetailsSection({required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _DetailRow(label: 'Dosage', value: prescription.dosage),
        const SizedBox(height: 4),
        _DetailRow(label: 'Frequency', value: prescription.frequency),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
        children: [
          TextSpan(text: '$label: '),
          TextSpan(
            text: value,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primaryBlue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'View Details',
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: AppColors.textWhite,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'Request Refill',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
