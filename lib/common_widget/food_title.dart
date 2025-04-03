import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/models/food.dart';
import 'package:flutter/material.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTitle({
    super.key,
    required this.food,
    required this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20,bottom: 15,left: 20,top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  //chi tiet mon an
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //images mon an
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(food.imagePath,width: 325),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(food.name,
                            style: TextStyle(
                                color: TColor.darkGray,
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                          ),),

                          const SizedBox(height: 10),

                          Text(food.description,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                          ),),

                          const SizedBox(height: 10),

                          Text('${food.price.toStringAsFixed(3)}đ',
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),),
                        ],
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
