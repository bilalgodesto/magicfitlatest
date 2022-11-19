import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_fit/services/workout_controller.dart';
import 'package:magic_fit/viewmodel/login_controller.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late LoginController loginController;
  late MockBuildContext _mockContext;
  late WorkoutController workController;
  setUpAll(() {
    loginController = LoginController();
    _mockContext = MockBuildContext();
    workController = WorkoutController();
  });

  group('Login controller with valid and invalid param', () {
    test('test login controller for invalid information', () async {
      var email = 'bilal@magic.fit';
      var password = 'abcdef';
      var result = await loginController.login(email, password);
      expect(result, false);
    });
    test('test login controller for valid information', () async {
      var email = 'bilal@magic.fit';
      var password = '123456';
      var result = await loginController.login(email, password);
      expect(result, true);
    });
  });

  group('test workout controller with add and remove workout', () {
    test('test workout controller for add new set', () async {
      List<Sets> sets = [
        Sets(
            exerciseItem: 'Barbels',
            repetitionSelected: 1,
            weightSelected: 1,
            setNumber: 1),
        Sets(
          exerciseItem: 'Barbels',
          repetitionSelected: 1,
          weightSelected: 1,
          setNumber: 2,
        ),
      ];
      var id = '1';
      print(_mockContext);
      workController.saveWorkoutTest(id, sets);
      expect(workController.items.length, greaterThanOrEqualTo(1));
    });
  });
}
