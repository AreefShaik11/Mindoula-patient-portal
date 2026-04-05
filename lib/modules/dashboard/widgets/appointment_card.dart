import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AppointmentCard extends StatelessWidget {
  final String date;
  final String month;
  final String title;
  final VoidCallback onJoin;

  const AppointmentCard({
    super.key,
    required this.date,
    required this.month,
    required this.title,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 653,
      height: 104,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          // Date box
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: AppColors.dateBoxBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: AppTypography.h3.copyWith(
                    color: AppColors.dateBoxText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  month,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.dateBoxText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upcoming appointment',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppTypography.contentStyle.copyWith(fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 124,
            height: 39,
            child: ElevatedButton(
              onPressed: onJoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Join Video'),
            ),
          ),
        ],
      ),
    );
  }
}
