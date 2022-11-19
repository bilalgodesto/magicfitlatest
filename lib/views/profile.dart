import 'package:flutter/material.dart';
import 'package:magic_fit/constants/app_colors.dart';
import 'package:magic_fit/widgets/Logo.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          padding: const EdgeInsets.only(
            top: 140,
          ),
          color: Colors.black,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Logo(),
                Text(
                  'Profile Screen',
                  key: ValueKey('profile'),
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Welcome to user profile',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
