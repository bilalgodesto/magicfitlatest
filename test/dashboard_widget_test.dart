// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:magic_fit/main.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:magic_fit/views/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('test dashboard and click add new click',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    var addNewButtonField = find.byKey(const ValueKey('add_new_button'));
    expect(addNewButtonField, findsOneWidget);

    await tester.tap(addNewButtonField);
    await tester.pumpAndSettle();

    var findNewScreen = find.byKey(const ValueKey('workout_form_text'));
    expect(findNewScreen, findsOneWidget);
  });

  testWidgets('test dashboard and click view listing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => WorkoutProvider()),
          ),
        ],
        child: Builder(
          builder: ((context) {
            return const MaterialApp(home: Dashboard());
          }),
        ),
      ),
    );

    var viewListingButton = find.byKey(const ValueKey('view_listing_button'));
    expect(viewListingButton, findsOneWidget);

    await tester.tap(viewListingButton);
    await tester.pumpAndSettle();

    var findNewScreen = find.byKey(const ValueKey('view_listing_screen'));
    expect(findNewScreen, findsOneWidget);
  });
}
