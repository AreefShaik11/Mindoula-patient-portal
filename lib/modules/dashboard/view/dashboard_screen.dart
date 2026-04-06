import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodel/dashboard_view_model.dart';
import '../widgets/appointment_card.dart';
import '../widgets/quick_action_card.dart';
import '../../../../core/theme/app_typography.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardViewModelProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello, ${state.userName}', style: AppTypography.h2),
          const SizedBox(height: 32),
          const Text(
            'Upcoming appointment',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF393B3F),
            ),
          ),
          const SizedBox(height: 16),
          AppointmentCard(
            title:
                state.nextAppointmentType ?? 'Adult Psychiatry Case Management',
            date: state.nextAppointmentDate ?? '14',
            month: state.nextAppointmentMonth ?? 'April',
            onJoin: () {},
          ),
          const SizedBox(height: 24),
          Text('How can we help you today?', style: AppTypography.sectionHeader),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 653),
            child: Column(
              children: [
                QuickActionCard(
                  title: 'View 3 new messages',
                  onTap: () => context.go('/messages'),
                  isNotification: true,
                ),
                const SizedBox(height: 12),
                QuickActionCard(
                  title: 'Request an appointment',
                  onTap: () => context.go('/appointments'),
                ),
                const SizedBox(height: 12),
                QuickActionCard(
                  title: 'Request a prescription refill',
                  onTap: () => context.go('/prescriptions'),
                ),
                const SizedBox(height: 12),
                QuickActionCard(
                  title: 'Send a message to my care team',
                  onTap: () => context.go('/messages'),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
