import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isNotification;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.onTap,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 653,
        height: 104,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            if (isNotification)
              Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(right: 16),
                decoration: const BoxDecoration(
                  color: AppColors.notificationBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            Expanded(
              child: Text(
                title,
                style: isNotification
                    ? AppTypography.notificationText
                    : AppTypography.h3.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
