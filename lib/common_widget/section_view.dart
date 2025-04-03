import 'package:delivery_food/common/color_extension.dart';
import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {

  final String title;
  final bool isShowSeeAllButon;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  const SectionView({
    super.key,
    required this.title,
    this.isShowSeeAllButon = true ,
    this.padding,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextButton(
              onPressed: onPressed,
              child: const Text(
                "Xem tất cả",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
          )
        ],
      ),
    );
  }
}
