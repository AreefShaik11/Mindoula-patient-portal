import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/main.dart';

void main() {
  testWidgets('Smoke test: Dashboard and Sidebar render', (WidgetTester tester) async {
    // Set a large viewport for web dashboard layout
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const ProviderScope(
        child: MindoulaPatientPortalApp(),
      ),
    );

    // Initial load: Should see "Hello, Jane"
    expect(find.text('Hello, Jane'), findsOneWidget);
    
    // Check Sidebar items
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Appointments'), findsOneWidget);
    
    // Check Appointment Card
    expect(find.text('Upcoming appointment'), findsOneWidget);
    expect(find.text('Join Video'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
  });
}
