import 'package:flutter/material.dart';
import 'package:magic_fit/constants/app_colors.dart';

import '../widgets/Logo.dart';
import 'dashboard.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const Text(
                'Log In',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  key: const ValueKey('email'),
                  controller: _emailController,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      focusedBorder: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                            color: AppColors.primary,
                            fontSize: 18,
                          )),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  key: const ValueKey('password'),
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      focusedBorder: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                            color: AppColors.primary,
                            fontSize: 18,
                          )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    width: 5,
                    color: AppColors.primary,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primary,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: InkWell(
                  key: const ValueKey('login'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return const Dashboard();
                      }),
                    );
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Don\'t have account. Please signup',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
