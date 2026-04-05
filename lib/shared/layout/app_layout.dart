import 'package:flutter/material.dart';
import '../widgets/sidebar/app_sidebar.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: AppConstants.contentPaddingLeft,
                top: 74.0, // Top 74px from Figma inspection
                right: 40.0,
                bottom: 40.0,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
