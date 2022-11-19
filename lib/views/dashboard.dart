import 'package:flutter/material.dart';
import 'package:magic_fit/constants/app_colors.dart';
import 'package:magic_fit/views/profile.dart';
import 'package:magic_fit/views/workout_listing_screen.dart';
import 'package:magic_fit/views/workout_screen.dart';
import 'package:magic_fit/widgets/Logo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          padding: const EdgeInsets.only(
            top: 140,
          ),
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const Text(
                'Workout Dashboard',
                key: ValueKey('dashboard'),
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add and view your workout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return const WorkOutScreen();
                          }),
                        );
                      }),
                      key: const ValueKey('add_new_button'),
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
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return const WorkoutListingScreen();
                          }),
                        );
                      }),
                      key: const ValueKey('view_listing_button'),
                      child: Container(
                        width: 120,
                        height: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFE5FA),
                          border: Border.all(
                            width: 5,
                            color: const Color(0xFFBC5DA5),
                          ),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.green,
                          //     blurRadius: 30,
                          //   ),
                          // ],
                        ),
                        child: const Text(
                          'Listing',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
