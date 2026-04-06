import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    String location;
    try {
      location = GoRouterState.of(context).uri.path;
    } catch (_) {
      location = '/';
    }

    return Container(
      width: 226,
      height: double.infinity,
      color: AppColors.sidebarBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sidebar Header
            Container(
              width: double.infinity,
              height: 74,
              color: AppColors.sidebarHeader,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              alignment: Alignment.centerLeft,
              child: Text('Member Portal', style: AppTypography.sidebarHeader),
            ),
  
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _SidebarItem(
                    label: 'Dashboard',
                    isSelected: location == '/',
                    onTap: () => context.go('/'),
                  ),
                  _SidebarItem(
                    label: 'Messaging Center',
                    isSelected: location == '/messages',
                    onTap: () => context.go('/messages'),
                  ),
                  _SidebarItem(
                    label: 'Appointments',
                    isSelected: location == '/appointments',
                    onTap: () => context.go('/appointments'),
                  ),
  
                  const _SectionDivider(),
  
                  _SidebarItem(
                    label: 'Prescription',
                    isSelected: location == '/prescriptions',
                    onTap: () => context.go('/prescriptions'),
                  ),
                  _SidebarItem(
                    label: 'Lab results',
                    isSelected: location == '/lab-results',
                    onTap: () => context.go('/lab-results'),
                  ),
                  _SidebarItem(
                    label: 'Questionnaires',
                    isSelected: location == '/questionnaires',
                    onTap: () => context.go('/questionnaires'),
                  ),
                  _SidebarItem(
                    label: 'Documents',
                    isSelected: location == '/documents',
                    onTap: () => context.go('/documents'),
                  ),
  
                  const _SectionDivider(),
  
                  _SidebarItem(
                    label: 'Insurance',
                    isSelected: location == '/insurance',
                    onTap: () => context.go('/insurance'),
                  ),
                  _SidebarItem(
                    label: 'Billing',
                    isSelected: location == '/billing',
                    onTap: () => context.go('/billing'),
                  ),
                  _SidebarItem(
                    label: 'Account',
                    isSelected: location == '/account',
                    onTap: () => context.go('/account'),
                  ),
  
                  const _SectionDivider(),
  
                  _SidebarItem(
                    label: 'Log Out',
                    isSelected: location == '/logout',
                    color: AppColors.error,
                    onTap: () => context.go('/logout'),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  const _SidebarItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = color ?? AppColors.activeIndicator;
    final defaultColor = color ?? AppColors.textPrimary;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTypography.sidebarItem.copyWith(
                  color: isSelected ? activeColor : defaultColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 41.0),
      child: Divider(height: 1, thickness: 1, color: AppColors.divider),
    );
  }
}
