import 'package:flutter/material.dart';
import 'package:magic_fit/services/workout_controller.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:magic_fit/views/workout_listing_screen.dart';
import 'package:magic_fit/widgets/workout/set_widget.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../widgets/Logo.dart';
import '../widgets/drop_down_container.dart';
import 'dashboard.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({
    Key? key,
    this.workoutItem,
  }) : super(key: key);
  final WorkoutItem? workoutItem;
  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  var init = false;
  String exerciseItem = "Barbell row";
  int selectedSetNumber = 1;
  List<Sets> selectedValuesForSet = [];
  List<String> exerciseItems = [
    'Barbell row',
    'Bench press',
    'Shoulder press',
    'Deadlift',
    'Squat'
  ];

  Future<void> saveWorkout() async {
    var totalItems =
        Provider.of<WorkoutProvider>(context, listen: false).items.length;
    totalItems += 1;
    var id = widget.workoutItem != null
        ? widget.workoutItem!.id
        : totalItems.toString();

    WorkoutController.saveWorkout(context, id, selectedValuesForSet);
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xFFE8E5FF),
            title: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Color(0XFF8C78EA),
              ))),
              child: const Text(
                'Saved Workout',
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 69, 142),
                ),
              ),
            ),
            content: const Text(
              'Your workout is saved successfully.',
              style: TextStyle(
                color: Color.fromARGB(255, 82, 69, 142),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                key: const ValueKey('viewListingButton'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0XFF8C78EA),
                )),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const WorkoutListingScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  'VIEW LISTING',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.workoutItem != null) {
      Future.delayed(Duration.zero, () {
        var items = Provider.of<WorkoutProvider>(context, listen: false).items;
        final index =
            items.indexWhere((element) => element.id == widget.workoutItem!.id);

        selectedValuesForSet = items[index].sets;
        selectedSetNumber = items[index].sets.length;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Workout Form',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) {
                return const Dashboard();
              })),
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        color: const Color(0xFFE8E5FF), //   const Color(0xFFE8E5FF),

        width: 400,
        height: 70,
        alignment: Alignment.center,
        child: ElevatedButton(
          key: const ValueKey('saveButton'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0XFF8C78EA),
          )),
          onPressed: () async {
            await saveWorkout();
          },
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.only(
            top: 40,
          ),
          color: AppColors.background,
          child: init == false
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    Text(
                      widget.workoutItem == null
                          ? 'Create workout'
                          : 'Update workout',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      key: const ValueKey('workout_form_text'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DropDownContainer(
                      label: 'Select set',
                      color: Colors.black,
                      child: DropdownButton(
                        key: const ValueKey('selectSet'),
                        underline: Container(),
                        isExpanded: true,
                        value: selectedSetNumber,
                        onChanged: (newValue) async {
// //_selectedCountry = newValue;
                        },
                        items: List.generate(12, (index) {
                          index = index + 1;
                          return DropdownMenuItem(
                            value: index,
                            onTap: () {
                              selectedValuesForSet.clear();
                              setState(() {
                                selectedSetNumber = index;
                              });
                            },
                            child: Text(
                              index.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Column(
                      children: List.generate(selectedSetNumber, (index) {
                        var setNumberValue = index + 1;
                        final findPrevIndex = selectedValuesForSet.indexWhere(
                            (element) => element.setNumber == setNumberValue);

                        Sets? copySet;
                        if (findPrevIndex > -1) {
                          copySet = selectedValuesForSet[findPrevIndex];
                          selectedValuesForSet.removeAt(findPrevIndex);

                          selectedValuesForSet.insert(
                              findPrevIndex,
                              Sets(
                                exerciseItem: widget.workoutItem == null
                                    ? exerciseItems[0]
                                    : copySet.exerciseItem,
                                repetitionSelected: widget.workoutItem == null
                                    ? 1
                                    : copySet.repetitionSelected,
                                weightSelected: widget.workoutItem == null
                                    ? 1
                                    : copySet.weightSelected,
                                setNumber: setNumberValue,
                              ));
                        } else {
                          selectedValuesForSet.add(
                            Sets(
                              exerciseItem: exerciseItems[0],
                              repetitionSelected: 1,
                              weightSelected: 1,
                              setNumber: setNumberValue,
                            ),
                          );
                        }

                        return SetWidget(
                          setNumber: index + 1,
                          exercise: widget.workoutItem == null
                              ? null
                              : copySet!.exerciseItem,
                          weight: widget.workoutItem == null
                              ? null
                              : copySet!.weightSelected,
                          repetition: widget.workoutItem == null
                              ? null
                              : copySet!.repetitionSelected,
                          pushSelectedValue: (Sets setValue) {
                            final setNumber = setValue.setNumber;
                            final findPrevIndex =
                                selectedValuesForSet.indexWhere((element) =>
                                    element.setNumber == setNumber);

                            if (findPrevIndex > -1) {
                              selectedValuesForSet.removeAt(findPrevIndex);
                              selectedValuesForSet.insert(
                                  findPrevIndex, setValue);
                            } else {
                              selectedValuesForSet.add(setValue);
                            }
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
