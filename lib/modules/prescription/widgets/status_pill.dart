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
        bgColor = AppColors.statusActiveBg;
        textColor = AppColors.statusActiveText;
        label = 'Active';
        break;
      case PrescriptionStatus.stopped:
        bgColor = AppColors.statusStoppedBg;
        textColor = AppColors.statusStoppedText;
        label = 'Stopped';
        break;
      case PrescriptionStatus.onHold:
        bgColor = AppColors.statusOnHoldBg;
        textColor = AppColors.statusOnHoldText;
        label = 'On Hold';
        break;
      case PrescriptionStatus.expired:
        bgColor = AppColors.statusExpiredBg;
        textColor = AppColors.statusExpiredText;
        label = 'Expired';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
