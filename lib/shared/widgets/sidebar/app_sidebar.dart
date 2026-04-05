import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Container(
      width: 309,
      height: double.infinity,
      color: AppColors.sidebarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Header
          Container(
            width: double.infinity,
            height: 90,
            color: AppColors.sidebarHeader,
            padding: const EdgeInsets.symmetric(horizontal: 41.0),
            alignment: Alignment.centerLeft,
            child: Text('Member Portal', style: AppTypography.sidebarHeader),
          ),

          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _SidebarItem(
                  label: 'Home',
                  icon: Icons.home_outlined,
                  isSelected: location == '/',
                  onTap: () => context.go('/'),
                ),
                _SidebarItem(
                  label: 'Messages',
                  icon: Icons.mail_outline,
                  isSelected: location == '/messages',
                  onTap: () => context.go('/messages'),
                ),
                _SidebarItem(
                  label: 'Appointments',
                  icon: Icons.calendar_today_outlined,
                  isSelected: location == '/appointments',
                  onTap: () => context.go('/appointments'),
                ),

                const _SectionDivider(),

                _SidebarItem(
                  label: 'Prescriptions',
                  icon: Icons.medication_outlined,
                  isSelected: location == '/prescriptions',
                  onTap: () => context.go('/prescriptions'),
                ),
                _SidebarItem(
                  label: 'Lab results',
                  icon: Icons.science_outlined,
                  isSelected: location == '/lab-results',
                  onTap: () => context.go('/lab-results'),
                ),
                _SidebarItem(
                  label: 'Questionnaires',
                  icon: Icons.assignment_outlined,
                  isSelected: location == '/questionnaires',
                  onTap: () => context.go('/questionnaires'),
                ),
                _SidebarItem(
                  label: 'Documents',
                  icon: Icons.description_outlined,
                  isSelected: location == '/documents',
                  onTap: () => context.go('/documents'),
                ),

                const _SectionDivider(),

                _SidebarItem(
                  label: 'Insurance',
                  icon: Icons.verified_user_outlined,
                  isSelected: location == '/insurance',
                  onTap: () => context.go('/insurance'),
                ),
                _SidebarItem(
                  label: 'Billing',
                  icon: Icons.receipt_long_outlined,
                  isSelected: location == '/billing',
                  onTap: () => context.go('/billing'),
                ),
                _SidebarItem(
                  label: 'Account',
                  icon: Icons.person_outline,
                  isSelected: location == '/account',
                  onTap: () => context.go('/account'),
                ),

                const _SectionDivider(),

                _SidebarItem(
                  label: 'Log Out',
                  icon: Icons.logout_outlined,
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
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  const _SidebarItem({
    required this.icon,
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
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 41.0),
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
                width: 8,
                height: 8,
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
