import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DropDownContainer extends StatelessWidget {
  DropDownContainer(
      {Key? key, required this.child, required this.label, this.color})
      : super(key: key);
  final Widget child;
  final String label;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: color == null ? AppColors.primary : color!,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ],
    );
  }
}
