import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/cart_tile.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/view/cart/delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context,restaurant,child){
      //giỏ hàng
      final useCart = restaurant.cart;
      final totalPrice = restaurant.getTotalPrice();

      //giao diện
      return SafeArea(
        child: Scaffold(
          backgroundColor:TColor.redColor.withOpacity(0.2),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red.withOpacity(0.9),
            title: const Text("Giỏ hàng",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  if(useCart.isEmpty){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: TColor.lightGrey,
                        title: Text("Giỏ hàng trống",
                          style: TextStyle(
                            color: Colors.redAccent.withOpacity(0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: const Text("Không thể xóa khi giỏ hàng đang trống.",
                          style: TextStyle(
                            fontSize: 20,
                            color: TColor.fontGrey,
                          ),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("OK",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }else{
                    showDialog(
                      context: context,
                      builder: (context)=> AlertDialog(
                        title: const Text("Thông báo",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 25,
                              fontWeight: FontWeight.w500
                          ),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: const Text("Bạn có chắc muốn xóa hết trong giỏ hàng?",
                          style: TextStyle(
                              color: TColor.darkFontGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Đóng",
                              style: TextStyle(
                                  color: TColor.fontGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("Có",
                              style: TextStyle(
                                  color: TColor.darkFontGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                              ),),
                          ),
                        ],
                      ),
                    );
                  }
                },
                  child: const Text("Xóa tất cả",
                    style: TextStyle(
                      fontSize: 20,
                      color: TColor.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
               Column(
                children: [
                  const SizedBox(height: 10),
                  useCart.isEmpty ?
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/box.png"),

                          const SizedBox(height: 10),

                          const Text("Giỏ hàng trống ....",
                            style: TextStyle(
                              fontSize: 25,
                              color: TColor.darkFontGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) : Expanded(
                    child: ListView.builder(
                        itemCount: useCart.length,
                        itemBuilder: (context,index) {
                          final cartItem = useCart[index];
                          return CartTile(
                            cartItem: cartItem,
                          );
                        }
                    ),
                  ),

                  const SizedBox(height: 65),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: TColor.whiteColor, // Màu nền của container
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text("Tổng tiền :",
                                style: TextStyle(
                                    color: TColor.darkFontGrey,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                totalPrice != 0 ? restaurant.formatPrice(totalPrice) : '0đ',
                                style: TextStyle(
                                  color: TColor.darkGray,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton(onPressed: (){
                              if(useCart.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: TColor.lightGrey,
                                    title: Text("Giỏ hàng trống",
                                      style: TextStyle(
                                        color: Colors.redAccent.withOpacity(0.8),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    content: const Text("Không thể thanh toán khi giỏ hàng đang trống.",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: TColor.fontGrey,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                Get.to(const DeliveryView());
                                // print(useCart.length.toString());
                              }
                            },
                              child: const Text("Thanh toán",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
