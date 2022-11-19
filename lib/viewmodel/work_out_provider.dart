import 'package:flutter/material.dart';

class Sets {
  final String exerciseItem;
  final int repetitionSelected;
  final int weightSelected;
  final int setNumber;
  Sets({
    required this.exerciseItem,
    required this.repetitionSelected,
    required this.weightSelected,
    required this.setNumber,
  });
  Map<String, dynamic> toMap() {
    return {
      'exerciseItem': exerciseItem,
      'repetitionSelected': repetitionSelected,
      'weightSelected': weightSelected,
      'setNumber': setNumber,
    };
  }

  static Sets fromMap(Map<String, dynamic> map) {
    return Sets(
      exerciseItem: map['exerciseItem'] as String,
      repetitionSelected: map['repetitionSelected'] as int,
      weightSelected: map['weightSelected'] as int,
      setNumber: map['setNumber'] as int,
    );
  }
}

class WorkoutItem {
  final List<Sets> sets;
  final String id;
  final DateTime dateTime;
  WorkoutItem({
    required this.sets,
    required this.id,
    required this.dateTime,
  });
}

class WorkoutProvider extends ChangeNotifier {
  List<WorkoutItem> _items = [];
  List<WorkoutItem> get items {
    return [..._items];
  }

  Future<void> clear() async {
    _items = [];
    notifyListeners();
  }

  void addNew(String id, WorkoutItem m) {
    final index = items.indexWhere((element) => element.id == id);

    if (index == -1) {
      final WorkoutItem _item = WorkoutItem(
        id: m.id,
        sets: m.sets,
        dateTime: m.dateTime,
      );
      _items.add(_item);
    } else {
      final WorkoutItem _item =
          WorkoutItem(id: m.id, sets: m.sets, dateTime: m.dateTime);
      _items[index] = _item;
      print('edited');
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    final index = items.indexWhere((element) => element.id == id);
    print(index);
    final s = _items.removeAt(index);
    print(s);
    notifyListeners();
  }
}
