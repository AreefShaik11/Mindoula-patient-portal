import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PortalListCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? minHeight;
  final Color? leftAccentColor;

  const PortalListCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    this.height,
    this.minHeight = 104.0,
    this.leftAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
        maxWidth: 1091,
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Stack(
        children: [
          if (leftAccentColor != null)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 6,
                color: leftAccentColor,
              ),
            ),
          Padding(
            padding: padding!,
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
