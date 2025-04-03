import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          //giảm số lượng
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(
              Icons.remove,
              size: 20,
              color: TColor.whiteColor,
            ),
          ),
          const SizedBox(width: 5,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5,),
          //tăng số lượng
          GestureDetector(
            onTap: onIncrement,
            child: const Icon(
              Icons.add,
              size: 20,
              color: TColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
