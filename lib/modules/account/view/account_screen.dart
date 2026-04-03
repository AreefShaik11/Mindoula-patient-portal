import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/account_view_model.dart';
import '../widgets/profile_item.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(accountViewModelProvider);
    final notifier = ref.read(accountViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: AppColors.activeIndicator,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: AppTypography.h3,
                unselectedLabelStyle: AppTypography.h3.copyWith(
                  color: AppColors.textSecondary,
                ),
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'Settings'),
                  Tab(text: 'Notifications'),
                  Tab(text: 'Delegate / Care Givers'),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 653,
                height: 500,
                child: TabBarView(
                  children: [
                    // Settings Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileItem(
                            label: 'Full Name',
                            value: state.fullName,
                            onTap: () {},
                          ),
                          const Divider(),
                          ProfileItem(
                            label: 'Email',
                            value: state.email,
                            actionLabel: 'Change',
                            onTap: () {},
                          ),
                          const Divider(),
                          ProfileItem(
                            label: 'Password',
                            value: '************',
                            actionLabel: 'Change',
                            onTap: () {},
                          ),
                          const Divider(),
                          ProfileItem(
                            label: 'Language',
                            value: state.language,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    // Notifications Tab
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _NotificationToggle(
                            label: 'Email Notifications',
                            value: state.emailNotifications,
                            onChanged: notifier.toggleEmailNotifications,
                          ),
                          const Divider(),
                          _NotificationToggle(
                            label: 'SMS Notifications',
                            value: state.smsNotifications,
                            onChanged: notifier.toggleSmsNotifications,
                          ),
                          const Divider(),
                          _NotificationToggle(
                            label: 'Appointment Reminders',
                            value: true,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                    ),
                    // Delegate Tab
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _DelegateItem(name: 'John Doe', relation: 'Father'),
                          const Divider(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('+ Add Delegate', style: TextStyle(color: AppColors.primaryBlue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationToggle({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: AppTypography.bodyLarge),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primaryBlue.withValues(alpha: 0.5),
        activeThumbColor: AppColors.primaryBlue,
      ),
    );
  }
}

class _DelegateItem extends StatelessWidget {
  final String name;
  final String relation;

  const _DelegateItem({required this.name, required this.relation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: AppTypography.bodyLarge),
      subtitle: Text(relation, style: AppTypography.bodySmall),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Remove', style: TextStyle(color: AppColors.error)),
      ),
    );
  }
}
