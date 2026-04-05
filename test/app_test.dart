import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Set a large surface size to prevent overflows in the test environment
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MindoulaPatientPortalApp(),
      ),
    );

    // Verify that the app starts.
    expect(find.byType(MindoulaPatientPortalApp), findsOneWidget);
    
    // Reset the test view
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
