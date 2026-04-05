import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account', style: AppTypography.h1),
          const SizedBox(height: 32),
          const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: AppColors.primaryBlue,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primaryBlue,
            tabs: [
              Tab(text: 'Personal Information'),
              Tab(text: 'Delegates'),
              Tab(text: 'Security'),
              Tab(text: 'Notifications'),
              Tab(text: 'Preferences'),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: TabBarView(
                children: [
                   // Personal Information Tab
                  _PersonalInfoTab(),
                  // Delegate Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const _DelegateItem(name: 'John Doe', relation: 'Father'),
                        const Divider(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('+ Add Delegate', style: TextStyle(color: AppColors.primaryBlue)),
                        ),
                      ],
                    ),
                  ),
                  const Center(child: Text('Security Settings')),
                  const Center(child: Text('Notification Preferences')),
                  const Center(child: Text('App Preferences')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFE5E7EB),
            child: Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          _ProfileField(label: 'Full Name', value: 'Jane Doe'),
          _ProfileField(label: 'Date of Birth', value: '01/01/1990'),
          _ProfileField(label: 'Email', value: 'jane.doe@example.com'),
          _ProfileField(label: 'Phone', value: '(555) 000-1234'),
          _ProfileField(label: 'Address', value: '123 Main St, Anytown, ST 12345'),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.bodySmall),
          const SizedBox(height: 8),
          Text(value, style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
          const Divider(),
        ],
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
