import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/delete_cart.dart';
import 'package:delivery_food/common_widget/quantity_selector.dart';
import 'package:delivery_food/models/cart_item.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context,restaurant,child)=>Container(
          decoration: BoxDecoration(
            color: TColor.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 330,
                      child: Image.asset(
                        cartItem.food.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                cartItem.food.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,

                ),),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    const SizedBox(height: 10),
                    QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onIncrement: (){
                          restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                        },
                        onDecrement: (){
                          restaurant.removeAllFromCart(cartItem);
                        }
                    ),
                    const Spacer(),
                    Text('${cartItem.food.price.toStringAsFixed(3)}đ',
                      style: const TextStyle(
                        color: TColor.fontGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),
              ),
              //chọn lựa mục đi kèm
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black54,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),

              const SizedBox(height: 10),

              Wrap(
                children: cartItem.selectedAddons.map((addon) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.textfieldGrey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                addon.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: TColor.primaryText,
                                ),
                              ),
                              if (addon.price > 0) // Kiểm tra nếu giá lớn hơn 0
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '+${addon.price.toStringAsFixed(3)} đ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: TColor.primaryText,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      //xóa item trong giỏ hàng
                      DeleteCart(
                          food:  cartItem.food,
                          deleteCart: (){
                            restaurant.deleteFromCart(cartItem);
                          }
                      ),
                    ],
                  );
                }).toList(),
              ),

            ],
          ),
        ),
    );
  }
}
