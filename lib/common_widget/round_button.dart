import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Function() onPressed;
  const RoundButton({super.key, required this.title, this.bgColor , required this.onPressed,  Widget? child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: bgColor ?? TColor.redColor,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
      ),
    );
  }
}

