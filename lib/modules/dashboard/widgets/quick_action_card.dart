import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isNotification;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isNotification ? AppColors.messageBlue : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isNotification ? AppColors.primaryBlue : AppColors.border,
            width: isNotification ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: AppTypography.h3.copyWith(
                  color: isNotification ? AppColors.primaryBlue : AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isNotification ? AppColors.primaryBlue : AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
