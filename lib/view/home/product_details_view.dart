import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      height: media.width*0.7,
                      decoration: BoxDecoration(
                        color: TColor.lightGrey,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/My_Box_1_Combo_jpg.jpg",
                        height: 200,
                        width: media.width*0.95,
                        fit: BoxFit.fill,),
                    ),
                    SafeArea(
                      child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(onPressed: (){
                            Navigator.pop(context);
                          },
                            icon: Image.asset("assets/images/back.png",
                                width: 20,
                                height: 20),),
                          actions:[
                            IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Image.asset("assets/images/share.png",
                                    width: 20,
                                    height: 20)),
                          ]
                      ),),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Khuyến mãi Combo 1",
                           style: TextStyle(
                             color: TColor.primaryText,
                             fontSize: 25,
                             fontWeight: FontWeight.w600,
                           ),),
                       ],
                     ),

                    const SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset("assets/images/minus-sign.png",
                                width: 20,
                                height: 20,),
                            ),
                          ),

                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: TColor.whiteColor,
                                border: Border.all(
                                  color: TColor.secondaryText,width: 1
                                ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text("1",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset("assets/images/plus.png",
                                width: 20,
                                height: 20,),
                            ),
                          ),
                          const Spacer(),
                          Text("79.000đ",
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Divider(color: Colors.black26,height: 1,),
                      const SizedBox(height: 15),

                      Text("Chi tiết sản phẩm",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Dành Cho 1-2 Người 01 Pizza Gà Nướng Nấm/Phô Mai Cao Cấp/Pepperoni (Cỡ Nhỏ) 01 Bánh Mì Bơ Tỏi/ Bánh Cuộn Phô Mai/ Khoai Tây Chiên",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 15),

                      RoundButton(title: "Thêm vào giỏ hàng",
                          onPressed: (){

                          }),
                    ],
                  ),
                ),
                // const Text(
                //   "Đăng nhập",
                //   style: TextStyle(
                //       color: TColor.whiteColor,
                //       fontSize: 30,
                //       fontWeight: FontWeight.w700),
                // ),
                //
                // SizedBox(height: media.width*0.1),


              ],
            ),
          ),
        );
  }
}
