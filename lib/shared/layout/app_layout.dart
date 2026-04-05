import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/sidebar/app_sidebar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: Container(
              color: AppColors.background,
              padding: const EdgeInsets.all(40.0), // Spacing from Figma
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
