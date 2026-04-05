import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/sidebar/app_sidebar.dart';

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
                left: 40.0,
                top: 74.0, // Header alignment from Figma
                right: 40.0,
                bottom: 40.0,
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
