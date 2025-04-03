import 'package:delivery_food/common/color_extension.dart';
import 'package:flutter/material.dart';

class DescriptioBox extends StatelessWidget {
  const DescriptioBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColor.primaryText),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("15.000đ",
                style: TextStyle(
                    color: TColor.darkFontGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),),
              Text("Phí giao hàng",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))
            ],
          ),

          Column(
            children: [
              Text("Từ 15-30p",
                  style: TextStyle(
                      color: TColor.darkFontGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Text("Thời gian giao hàng",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
