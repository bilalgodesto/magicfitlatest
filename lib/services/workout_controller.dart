import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/work_out_provider.dart';

class WorkoutController {
  List<WorkoutItem> _items = [];
  List<WorkoutItem> get items {
    return [..._items];
  }

  static void saveWorkout(BuildContext context, String id, List<Sets> set) {
    try {
      var totalItems =
          Provider.of<WorkoutProvider>(context, listen: false).items.length;

      totalItems = totalItems + 1;

      WorkoutItem item = WorkoutItem(
        sets: set,
        id: id,
        dateTime: DateTime.now(),
      );

      Provider.of<WorkoutProvider>(context, listen: false)
          .addNew(item.id, item);
    } catch (e) {
      print(e.toString());
    }
  }

  void saveWorkoutTest(String id, List<Sets> set) {
    try {
      var totalItems = _items.length;
      totalItems = totalItems + 1;
      WorkoutItem item = WorkoutItem(
        sets: set,
        id: id,
        dateTime: DateTime.now(),
      );

      final index = items.indexWhere((element) => element.id == id);
      if (index == -1) {
        _items.add(item);
      } else {
        _items[index] = item;
        print('edited');
      }
    } catch (e) {}
  }

  static void removeItem(String id, BuildContext context) {
    Provider.of<WorkoutProvider>(context, listen: false).deleteItem(id);
  }

  static int lengthOfItems(BuildContext context) {
    return Provider.of<WorkoutProvider>(context, listen: false).items.length;
  }
}
