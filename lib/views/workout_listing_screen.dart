import 'package:flutter/material.dart';
import 'package:magic_fit/viewmodel/work_out_provider.dart';
import 'package:magic_fit/views/workout_screen.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../widgets/Logo.dart';
import '../widgets/workout/workout_list_item.dart';
import 'dashboard.dart';

class WorkoutListingScreen extends StatefulWidget {
  const WorkoutListingScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutListingScreen> createState() => _WorkoutListingScreenState();
}

class _WorkoutListingScreenState extends State<WorkoutListingScreen> {
  List<WorkoutItem>? _workoutList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Workout Listing',
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

        // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Consumer<WorkoutProvider>(builder: (context, workProvider, _) {
        _workoutList =
            Provider.of<WorkoutProvider>(context, listen: false).items;
        return Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.only(
            top: 40,
          ),
          color: const Color.fromARGB(255, 230, 230, 230),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const Text(
                'Workout Listing',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                key: ValueKey('view_listing_screen'),
              ),
              _workoutList == null || _workoutList!.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 60),
                      height: MediaQuery.of(context).size.height * 1,
                      child: Column(
                        children: [
                          const Text(
                            'You have not added any workout.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                            key: ValueKey('noworkout'),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) {
                                  return const WorkOutScreen();
                                }),
                              );
                            }),
                            key: const ValueKey('add_new'),
                            child: Container(
                              width: 120,
                              height: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFE8E5FF),

                                border: Border.all(
                                  width: 5,
                                  color: const Color(0XFF8C78EA),
                                ),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Colors.blue,
                                //     blurRadius: 30,
                                //   ),
                                // ],
                              ),
                              child: const Text(
                                'Add New',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: _workoutList!.map((item) {
                        return WorkutListItem(
                          item: item,
                          key: UniqueKey(),
                        );
                      }).toList(),
                    ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      })),
    );
  }
}
