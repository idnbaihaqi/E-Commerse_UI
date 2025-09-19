// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skl_1_ui/main.dart';
import 'package:skl_1_ui/pages/account_page.dart';

void main() {
  testWidgets('App loads and shows AccountPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the AccountPage is loaded by checking for a widget that's unique to it
    expect(find.byType(AccountPage), findsOneWidget);
    
    // You can add more specific tests here, for example:
    // expect(find.text('My Account'), findsOneWidget);
  });
}
