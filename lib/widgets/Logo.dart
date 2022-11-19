import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: AppColors.primary,
        ),
      ),
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
