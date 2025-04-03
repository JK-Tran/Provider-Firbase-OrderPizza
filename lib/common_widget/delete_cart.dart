import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';

class DeleteCart extends StatelessWidget {
  final Food food;
  final VoidCallback deleteCart;

  const DeleteCart({
    super.key,
    required this.food,
    required this.deleteCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.fontGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Row(
        children: [
          //giảm số lượng
          GestureDetector(
            onTap: deleteCart,
            child: const Icon(
              Icons.delete,
              size: 30,
              color: TColor.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
