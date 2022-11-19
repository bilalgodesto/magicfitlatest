import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:magic_fit/services/workout_controller.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:magic_fit/views/dashboard.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //late NavigatorObserver mockObserver;

  setUpAll(() {
    //  mockObserver = MockNavigatorObserver();
    //_mockContext = MockBuildContext();
  });

  group('end-to-end test', () {
    testWidgets('add workout and view listing', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: ((context) => WorkoutProvider()),
            ),
          ],
          child: Builder(
            builder: ((context) {
              return MaterialApp(
                key: scaffoldKey,
                home: const Dashboard(),
              );
            }),
          ),
        ),
      );

      var addNewButtonField = find.byKey(const ValueKey('add_new_button'));
      expect(addNewButtonField, findsOneWidget);

      await tester.tap(addNewButtonField);
      await tester.pumpAndSettle();

      var selectSetFinder = find.byKey(const ValueKey('selectSet'));
      expect(selectSetFinder, findsOneWidget);

      await tester.tap(selectSetFinder);
      await tester.pumpAndSettle();

      final selectSet = find.text('1').last;
      await tester.tap(selectSet);
      await tester.pumpAndSettle();

      var selectExerciseFinder = find.byKey(const ValueKey('selectExercise1'));
      var selectWeightFinder = find.byKey(const ValueKey('selectWeight1'));
      var selectRepetitionFinder =
          find.byKey(const ValueKey('selectRepetition1'));

      expect(selectExerciseFinder, findsOneWidget);
      expect(selectWeightFinder, findsOneWidget);
      expect(selectRepetitionFinder, findsOneWidget);

      await tester.tap(selectExerciseFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Barbell row').last);
      await tester.pumpAndSettle();

      await tester.tap(selectWeightFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('10').last);
      await tester.pumpAndSettle();

      await tester.tap(selectRepetitionFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('3').last);
      await tester.pumpAndSettle();

      var saveButton = find.byKey(const ValueKey('saveButton'));
      expect(saveButton, findsOneWidget);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      var viewListingButton = find.byKey(const ValueKey('viewListingButton'));
      expect(viewListingButton, findsOneWidget);
      await tester.tap(viewListingButton);
      await tester.pumpAndSettle();

      var viewListingScreen = find.byKey(const ValueKey('view_listing_screen'));
      expect(viewListingScreen, findsOneWidget);

      var count = WorkoutController.lengthOfItems(scaffoldKey.currentContext!);
      expect(count, greaterThanOrEqualTo(1));

      var items = Provider.of<WorkoutProvider>(scaffoldKey.currentContext!,
              listen: false)
          .items;
      var item = items[0];

      WorkoutController.removeItem(item.id, scaffoldKey.currentContext!);

      var countAfterDelete =
          WorkoutController.lengthOfItems(scaffoldKey.currentContext!);

      expect(countAfterDelete, lessThan(count));
    });

    // testWidgets('Tap profile button to view profile',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(const MaterialApp(home: Dashboard()));
    //   var viewProfileButton = find.byKey(const ValueKey('view_profile'));
    //   expect(viewProfileButton, findsOneWidget);

    //   await tester.tap(viewProfileButton);
    //   await tester.pump(
    //     const Duration(seconds: 1),
    //   );
    //   expect(find.byKey(const ValueKey('profile')), findsOneWidget);

    //   //var dashbord = find.byKey( const ValueKey('dashboard'));
    // });
  });
}
