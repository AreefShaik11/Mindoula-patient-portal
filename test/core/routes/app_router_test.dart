import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/core/routes/app_router.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';
import 'package:mindoula_patient_portal/modules/billing/view/billing_screen.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('AppRouter Tests', () {
    testWidgets('should render DashboardScreen as initial route', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: Consumer(
            builder: (context, ref, child) {
              final router = ref.watch(appRouterProvider);
              return MaterialApp.router(
                routerConfig: router,
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('should navigate to billing route', (tester) async {
      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      router.go('/billing');
      await tester.pumpAndSettle();

      expect(find.byType(BillingScreen), findsOneWidget);
    });

    testWidgets('should navigate to account route', (tester) async {
      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      router.go('/account');
      await tester.pumpAndSettle();

      expect(find.byType(AccountScreen), findsOneWidget);
    });

    testWidgets('should navigate to placeholder routes', (tester) async {
      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      router.go('/appointments');
      await tester.pumpAndSettle();
      expect(find.textContaining('Coming Soon: Appointments'), findsOneWidget);

      router.go('/lab-results');
      await tester.pumpAndSettle();
      expect(find.textContaining('Coming Soon: Lab Results'), findsOneWidget);

      router.go('/insurance');
      await tester.pumpAndSettle();
      expect(find.textContaining('Coming Soon: Insurance'), findsOneWidget);
      
      router.go('/logout');
      await tester.pumpAndSettle();
      expect(find.textContaining('Coming Soon: Logging Out...'), findsOneWidget);
    });
  });
}
