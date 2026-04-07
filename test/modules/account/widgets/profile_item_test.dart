import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/widgets/profile_item.dart';

void main() {
  group('ProfileItem Tests', () {
    testWidgets('renders all details correctly and clicks', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileItem(
              label: 'Full Name',
              value: 'Jane Doe',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Full Name:'), findsOneWidget);
      expect(find.text('Jane Doe'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);

      await tester.tap(find.text('Edit'));
      expect(tapped, isTrue);
    });

    testWidgets('supports custom action label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileItem(
              label: 'Password',
              value: '********',
              actionLabel: 'Change',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Password:'), findsOneWidget);
      expect(find.text('Change'), findsOneWidget);
    });
  });
}
