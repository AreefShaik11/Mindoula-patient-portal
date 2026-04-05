import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AppointmentCard extends StatelessWidget {
  final String date;
  final String time;
  final String providerName;
  final String specialty;

  const AppointmentCard({
    super.key,
    required this.date,
    required this.time,
    required this.providerName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          // Date Box (Figma Blue Box)
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.dateBoxBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  date.split(' ')[0], // Month
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.dateBoxText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date.split(' ')[1], // Day
                  style: AppTypography.h3.copyWith(
                    color: AppColors.dateBoxText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$time - $providerName', style: AppTypography.h3),
                const SizedBox(height: 4),
                Text(specialty, style: AppTypography.bodyMedium),
              ],
            ),
          ),
          
          // Action
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Join Video', style: AppTypography.buttonLarge),
          ),
        ],
      ),
    );
  }
}
