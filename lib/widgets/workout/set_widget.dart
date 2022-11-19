import 'package:flutter/material.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import '../drop_down_container.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({
    Key? key,
    required this.setNumber,
    required this.pushSelectedValue,
    this.exercise,
    this.weight,
    this.repetition,
  }) : super(key: key);
  final int setNumber;
  final Function pushSelectedValue;
  final String? exercise;
  final int? weight;
  final int? repetition;
  @override
  State<SetWidget> createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  String exerciseItem = "Barbell row";
  int weightSelected = 1;
  int repetitionSelected = 1;
  var init = false;
  List<String> exerciseItems = [
    'Barbell row',
    'Bench press',
    'Shoulder press',
    'Deadlift',
    'Squat'
  ];
  List<int> weightCollection = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];
  List<int> repetitionCollection = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];

  void saveValues() {
    Sets selectedValuesForSet = Sets(
      exerciseItem: exerciseItem,
      repetitionSelected: repetitionSelected,
      weightSelected: weightSelected,
      setNumber: widget.setNumber,
    );
    widget.pushSelectedValue(selectedValuesForSet);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.exercise != null) {
      Future.delayed(Duration.zero, () {
        exerciseItem = widget.exercise!;
        weightSelected = widget.weight!;
        repetitionSelected = widget.repetition!;

        setState(() {
          init = true;
        });
      });
    } else {
      setState(() {
        init = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return init == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select details for set number ${widget.setNumber}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropDownContainer(
                    label: 'Select Exercise',
                    color: Colors.black,
                    child: DropdownButton(
                      key: ValueKey('selectExercise${widget.setNumber}'),
                      underline: Container(),
                      isExpanded: true,
                      dropdownColor: Colors.black,
                      value: exerciseItem,
                      onChanged: (newValue) async {
// //_selectedCountry = newVasetState((){
                        exerciseItem = newValue.toString();
                        print(exerciseItem);
                        setState(() {});
                      },
                      items: exerciseItems.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          onTap: () {
                            exerciseItem = valueItem;
                            saveValues();
                          },
                          child: Text(
                            valueItem,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  DropDownContainer(
                    key: ValueKey('selectWeight${widget.setNumber}'),
                    label: 'Select Weight',
                    color: Colors.black,
                    child: DropdownButton(
                      dropdownColor: Colors.black,
                      underline: Container(),
                      isExpanded: true,
                      value: weightSelected,
                      onChanged: (newValue) async {
// //_selectedCountry = newValue;
                      },
                      items: weightCollection.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          onTap: () {
                            weightSelected = valueItem;
                            saveValues();
                          },
                          child: Text(
                            valueItem.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  DropDownContainer(
                    key: ValueKey('selectRepetition${widget.setNumber}'),
                    color: Colors.black,
                    label: 'Select Repetition',
                    child: DropdownButton(
                      underline: Container(),
                      dropdownColor: Colors.black,
                      isExpanded: true,
                      value: repetitionSelected,
                      onChanged: (newValue) async {
// //_selectedCountry = newValue;
                      },
                      items: repetitionCollection.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          onTap: () {
                            repetitionSelected = valueItem;
                            saveValues();
                          },
                          child: Text(
                            valueItem.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
