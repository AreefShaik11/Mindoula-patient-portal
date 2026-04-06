import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/cards/portal_list_card.dart';

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;
  final String actionLabel;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.label,
    required this.value,
    this.actionLabel = 'Edit',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PortalListCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: AppTypography.labelStyle),
                const SizedBox(height: 4),
                Text(value, style: AppTypography.contentStyle),
              ],
            ),
          ),
          SizedBox(
            width: actionLabel == 'Change' ? 133 : 124,
            height: 40,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryBlue, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                actionLabel,
                style: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

