import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/account_view_model.dart';
import '../widgets/profile_item.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/navigation/portal_tab_bar.dart';
import '../../../../shared/widgets/cards/portal_list_card.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = const ['Settings', 'Notifications', 'Delegate/Care Givers'];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountViewModelProvider);
    final notifier = ref.read(accountViewModelProvider.notifier);

    Widget content;
    switch (_selectedTabIndex) {
      case 0:
        content = Column(
          children: [
            ProfileItem(
              label: 'Full Name',
              value: state.fullName,
              onTap: () {},
            ),
            ProfileItem(
              label: 'Email',
              value: state.email,
              actionLabel: 'Change',
              onTap: () {},
            ),
            const ProfileItem(
              label: 'Password',
              value: '************',
              actionLabel: 'Change',
              onTap: _doNothing,
            ),
            ProfileItem(
              label: 'Language',
              value: state.language,
              onTap: () {},
            ),
          ],
        );
        break;
      case 1:
        content = Column(
          children: [
            _NotificationToggleItem(
              label: 'Email Notifications',
              value: state.emailNotifications,
              onChanged: notifier.toggleEmailNotifications,
            ),
            _NotificationToggleItem(
              label: 'SMS Notifications',
              value: state.smsNotifications,
              onChanged: notifier.toggleSmsNotifications,
            ),
            _NotificationToggleItem(
              label: 'Appointment Reminders',
              value: true,
              onChanged: (val) {},
            ),
          ],
        );
        break;
      case 2:
      default:
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DelegateItemCard(
              name: 'John Doe',
              relation: 'Father',
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text(
                '+ Add Delegate',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ),
          ],
        );
        break;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: AppTypography.pageTitle),
          const SizedBox(height: 32),
          PortalTabBar(
            tabs: _tabs,
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          const SizedBox(height: 32),
          content,
        ],
      ),
    );
  }

  static void _doNothing() {}
}

class _NotificationToggleItem extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationToggleItem({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PortalListCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.contentStyle),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primaryBlue.withValues(alpha: 0.5),
            activeThumbColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }
}

class _DelegateItemCard extends StatelessWidget {
  final String name;
  final String relation;

  const _DelegateItemCard({required this.name, required this.relation});

  @override
  Widget build(BuildContext context) {
    return PortalListCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: AppTypography.contentStyle),
              Text(relation, style: AppTypography.bodySmall),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Manage Access',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
