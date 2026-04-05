import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/dashboard_view_model.dart';
import '../widgets/appointment_card.dart';
import '../widgets/quick_action_card.dart';
import '../../../../../core/theme/app_typography.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final dashboardData = ref.watch(dashboardViewModelProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Text('Hello, Jane', style: AppTypography.h1),
          const SizedBox(height: 40),

          // Upcoming Appointment Section
          Text('Upcoming appointment', style: AppTypography.h2),
          const SizedBox(height: 20),
          const AppointmentCard(
            date: 'April 14',
            time: '10:00 AM',
            providerName: 'Dr. Sarah Johnson',
            specialty: 'Primary Care',
          ),
          const SizedBox(height: 60),

          // Quick Actions Section
          Text('How can we help you today?', style: AppTypography.h2),
          const SizedBox(height: 8),
          Text(
            'Select an option below to get started',
            style: AppTypography.bodyLarge,
          ),
          const SizedBox(height: 32),
          
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 2.5,
            children: [
              QuickActionCard(
                icon: Icons.calendar_month_outlined,
                label: 'Request an appointment',
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.medication_outlined,
                label: 'Request a prescription refill',
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.chat_bubble_outline,
                label: 'Send a message to my care team',
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.mail_outline,
                label: 'View 3 new messages',
                onTap: () {},
                isNotification: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
