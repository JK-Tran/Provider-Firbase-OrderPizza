import 'package:delivery_food/common/color_extension.dart';
import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const CategoryCell({
    super.key,
    required this.pObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(right: 10),

        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withOpacity(0.5),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child:ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pObj["icon"],
                    width: 170,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.topCenter, // Căn văn bản lên trên
                child: Text(
                  pObj["name"],
                  style: const TextStyle(
                    color: TColor.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}