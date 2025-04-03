import 'package:delivery_food/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';

class LineTextField extends StatefulWidget{
  TextEditingController controller;
  final String title;
  final String placeholder;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? right;
  final String? Function(String?)? validator;

  LineTextField({super.key,
    required this.title,
    required this.placeholder,
    required this.controller,
    this.right,
    this.keyboardType,
    this.obscureText = false,
    this.validator,});

  @override
  State<LineTextField> createState() => _LineTextFieldState();
}

class _LineTextFieldState extends State<LineTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: TColor.textTittle,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          TextFormField(
            autocorrect: false,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              suffixIcon: widget.right,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.placeholder,
              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 20),
            ),
            validator: widget.validator,
            style: const TextStyle(color: TColor.whiteColor),
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            color: const Color(0xffE2E2E2),
          )
        ],
      ),
    );
  }
}
