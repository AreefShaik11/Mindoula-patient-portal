import 'package:flutter/material.dart';
import '../model/prescription.dart';
import '../../../../core/theme/app_colors.dart';

class StatusPill extends StatelessWidget {
  final PrescriptionStatus status;
  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status) {
      case PrescriptionStatus.active:
        bgColor = const Color(0xFFE8F5E9);
        textColor = AppColors.success;
        label = 'Active';
        break;
      case PrescriptionStatus.pending:
        bgColor = const Color(0xFFFFF3E0);
        textColor = AppColors.warning;
        label = 'Pending';
        break;
      case PrescriptionStatus.expired:
        bgColor = const Color(0xFFFFEBEE);
        textColor = AppColors.error;
        label = 'Expired';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
