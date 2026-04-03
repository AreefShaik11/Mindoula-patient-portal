import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final routerState = GoRouterState.of(context);
    final currentPath = routerState.uri.path;

    return Container(
      width: AppConstants.sidebarWidth,
      height: double.infinity,
      color: AppColors.sidebarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Header (Dark Blue Bar)
          Container(
            width: double.infinity,
            height: 90,
            color: AppColors.sidebarHeader,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 41.0),
            child: Text(
              'Member Portal',
              style: AppTypography.sidebarHeader,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _SidebarItem(
                  title: 'Home',
                  icon: Icons.home_outlined,
                  path: '/dashboard',
                  isSelected: currentPath == '/dashboard',
                ),
                _SidebarItem(
                  title: 'Messages',
                  icon: Icons.mail_outline,
                  path: '/messages',
                  isSelected: currentPath == '/messages',
                ),
                _SidebarItem(
                  title: 'Appointments',
                  icon: Icons.calendar_today_outlined,
                  path: '/appointments',
                  isSelected: currentPath == '/appointments',
                ),
                _SidebarItem(
                  title: 'Prescriptions',
                  icon: Icons.medication_outlined,
                  path: '/prescriptions',
                  isSelected: currentPath == '/prescriptions',
                ),
                _SidebarItem(
                  title: 'Lab results',
                  icon: Icons.science_outlined,
                  path: '/lab-results',
                  isSelected: currentPath == '/lab-results',
                ),
                _SidebarItem(
                  title: 'Questionnaires',
                  icon: Icons.assignment_outlined,
                  path: '/questionnaires',
                  isSelected: currentPath == '/questionnaires',
                ),
                _SidebarItem(
                  title: 'Documents',
                  icon: Icons.description_outlined,
                  path: '/documents',
                  isSelected: currentPath == '/documents',
                ),
                _SidebarItem(
                  title: 'Insurance',
                  icon: Icons.verified_user_outlined,
                  path: '/insurance',
                  isSelected: currentPath == '/insurance',
                ),
                _SidebarItem(
                  title: 'Billing',
                  icon: Icons.receipt_long_outlined,
                  path: '/billing',
                  isSelected: currentPath == '/billing',
                ),
                _SidebarItem(
                  title: 'Account',
                  icon: Icons.person_outline,
                  path: '/account',
                  isSelected: currentPath == '/account',
                ),
                const SizedBox(height: 16),
                _SidebarItem(
                  title: 'Log Out',
                  icon: Icons.logout_outlined,
                  path: '/logout',
                  isSelected: currentPath == '/logout',
                  color: AppColors.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String path;
  final bool isSelected;
  final Color? color;

  const _SidebarItem({
    required this.title,
    required this.icon,
    required this.path,
    required this.isSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color itemColor = color ?? (isSelected ? AppColors.activeIndicator : AppColors.textPrimary);

    return InkWell(
      onTap: () => context.go(path),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 41.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTypography.sidebarItem.copyWith(
                  color: itemColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: itemColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
