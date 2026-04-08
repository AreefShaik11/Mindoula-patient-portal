import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('MessageCenterScreen Widget Tests', () {
    testWidgets('should render and interact in desktop view', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: MessageCenterScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Messages'), findsOneWidget);
      
      // Tap search and filter (hit empty handlers)
      await tester.tap(find.byIcon(Icons.search));
      await tester.tap(find.byIcon(Icons.filter_list));
      
      // Tap thread
      await tester.tap(find.text('Care Team'));
      await tester.pumpAndSettle();

      // Tap Request Appointment
      await tester.tap(find.text('Request Appointment'));
      
      // Tap Attach file
      await tester.tap(find.text('Attach file'));
      
      // Tap Send
      await tester.tap(find.text('Send'));
      
      await tester.pumpAndSettle();
    });

    testWidgets('should handle mobile view transitions and interactions', (tester) async {
      tester.view.physicalSize = const Size(500, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: MessageCenterScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      // Tap thread on mobile
      await tester.tap(find.text('Dr. J Kim'));
      await tester.pumpAndSettle();
      
      // Tap add icon (mobile attach)
      await tester.tap(find.byIcon(Icons.add));
      
      // Tap Send
      await tester.tap(find.text('Send'));
      
      // Back to list
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('should render special system cards and their actions', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: MessageCenterScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      // Expect specific cards
      expect(find.textContaining('appointment is confirmed'), findsOneWidget);
      expect(find.textContaining('Your lab results are ready'), findsAtLeastNWidgets(1));
      
      // Tap action buttons inside cards
      final viewButtons = find.text('View');
      if (tester.any(viewButtons)) {
        await tester.tap(viewButtons.first);
      }
      
      final signButton = find.text('Review & Sign');
      if (tester.any(signButton)) {
        await tester.tap(signButton);
      }
      
      await tester.pumpAndSettle();
    });
  });
}
