import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodel/dashboard_view_model.dart';
import '../widgets/appointment_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, ${state.userName}',
          style: AppTypography.h2,
        ),
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
          title: state.nextAppointmentType ?? 'Adult Psychiatry Case Management',
          date: '14',
          month: 'April',
          onJoin: () {},
        ),
        const SizedBox(height: 24), // 24px vertical gap as per Figma
        Text(
          'How can we help you today?',
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 653,
          child: Column(
            children: [
              _QuickActionCard(
                title: 'View 3 new messages',
                onTap: () => context.go('/messages'),
                isNotification: true,
              ),
              const SizedBox(height: 8),
              _QuickActionCard(
                title: 'Request an appointment',
                onTap: () => context.go('/appointments'),
              ),
              const SizedBox(height: 8),
              _QuickActionCard(
                title: 'Request a prescription refill',
                onTap: () => context.go('/prescriptions'),
              ),
              const SizedBox(height: 8),
              _QuickActionCard(
                title: 'Send a message to my care team',
                onTap: () => context.go('/messages'),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isNotification;

  const _QuickActionCard({
    required this.title,
    required this.onTap,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = isNotification 
        ? AppTypography.notificationText 
        : const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF393B3F),
          );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 653,
        height: 104,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFCACACA)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            if (isNotification)
              Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(right: 16),
                decoration: const BoxDecoration(
                  color: AppColors.notificationBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            Expanded(
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
