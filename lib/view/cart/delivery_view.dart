import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/my_receipt.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/services/auth/auth_service.dart';
import 'package:delivery_food/services/database/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryView extends StatelessWidget {

  const DeliveryView({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final authService = AuthService();
    FirestoreService db = FirestoreService();
    return Consumer<Restaurant>(builder: (context,restaurant,child){
      //final useCart = restaurant.cart;
      final totalPrice = restaurant.getTotalPrice();
      // final quantity = restaurant.getTotalIteamCount();
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            title: const Text("Đơn hàng",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.redAccent.withOpacity(0.9),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const MyReceipt(),
                const Text(
                  "Giao hàng trong 15-30p",
                  style: TextStyle(
                      color: TColor.darkFontGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 370,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () async{
                    double feeDelivery = 15.000;
                    String receipt =  context.read<Restaurant>().displayReceipt();
                    String userID = auth.currentUser?.uid ?? '';
                    String phone = await authService.getUserPhone(userID);
                    db.saveOrderToDatabase(userID,receipt,(restaurant.formatPrice(totalPrice+feeDelivery)),phone);
                    restaurant.clearCart();
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: const Text('Đặt hàng thành công',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange
                          ),
                        ),
                        content: const Text('Đơn hàng của bạn đã được đặt thành công.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                            },
                            child: const Text('Đóng',
                              style: TextStyle(
                                fontSize: 18,
                                color: TColor.darkFontGrey),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                    child: const Text(
                      "Thanh toán khi nhận hàng",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
// if (kDebugMode) {
//   print(useCart.length.toString());
// }
// restaurant.clearCart();
// if (kDebugMode) {
//   print(useCart.length.toString());
// }
// Navigator.pop(context);

// String formattedDate =  DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
//
// print(formattedDate);
// for(CartItem cartItem in useCart){
//   if (kDebugMode) {
//     print("${cartItem.food.name} ${cartItem.food.price.toStringAsFixed(3)}");
//     for(Addon addon in cartItem.selectedAddons){
//       if(cartItem.selectedAddons.isNotEmpty){
//         print("Chọn : ${addon.name}");
//       }
//     }
//   }
// }
// print(quantity);
// print(totalPrice.toStringAsFixed(3));
