import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Container(
      width: 300,
      color: AppColors.sidebarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            color: AppColors.sidebarHeader,
            child: Text(
              'Member Portal',
              style: AppTypography.sidebarHeader,
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                // Section 1: Home, Messages, Appointments
                _SidebarItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  isSelected: location == '/',
                  onTap: () => context.go('/'),
                ),
                _SidebarItem(
                  icon: Icons.chat_bubble_outline,
                  label: 'Messages',
                  isSelected: location == '/messages',
                  onTap: () => context.go('/messages'),
                ),
                _SidebarItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'Appointments',
                  isSelected: location == '/appointments',
                  onTap: () => context.go('/appointments'),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(height: 1, color: AppColors.divider),
                ),
                
                // Section 2: Prescriptions, Lab Results, Questionnaires, Documents
                _SidebarItem(
                  icon: Icons.medication_outlined,
                  label: 'Prescriptions',
                  isSelected: location == '/prescriptions',
                  onTap: () => context.go('/prescriptions'),
                ),
                _SidebarItem(
                  icon: Icons.biotech_outlined,
                  label: 'Lab results',
                  isSelected: location == '/lab-results',
                  onTap: () => context.go('/lab-results'),
                ),
                _SidebarItem(
                  icon: Icons.assignment_outlined,
                  label: 'Questionnaires',
                  isSelected: location == '/questionnaires',
                  onTap: () => context.go('/questionnaires'),
                ),
                _SidebarItem(
                  icon: Icons.description_outlined,
                  label: 'Documents',
                  isSelected: location == '/documents',
                  onTap: () => context.go('/documents'),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(height: 1, color: AppColors.divider),
                ),
                
                // Section 3: Insurance, Billing, Account
                _SidebarItem(
                  icon: Icons.security_outlined,
                  label: 'Insurance',
                  isSelected: location == '/insurance',
                  onTap: () => context.go('/insurance'),
                ),
                _SidebarItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Billing',
                  isSelected: location == '/billing',
                  onTap: () => context.go('/billing'),
                ),
                _SidebarItem(
                  icon: Icons.person_outline,
                  label: 'Account',
                  isSelected: location == '/account',
                  onTap: () => context.go('/account'),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(height: 1, color: AppColors.divider),
                ),
                
                // Section 4: Log Out
                _SidebarItem(
                  icon: Icons.logout,
                  label: 'Log Out',
                  isSelected: false,
                  onTap: () {},
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
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.white : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary),
            const SizedBox(width: 16),
            Text(
              label,
              style: AppTypography.sidebarItem.copyWith(
                color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
