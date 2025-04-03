import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  CurrentLocation({super.key});
  final txtController = TextEditingController();

  void openLocationBox(BuildContext context){
    txtController.text = context.read<Restaurant>().deliveryAdress;
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: const Text("Nơi bạn ở"),
          content: TextField(
            controller: txtController,
            decoration:  const InputDecoration(
              hintText: "Địa chỉ...."),
          ),
          actions: [
            MaterialButton(onPressed: (){
              Navigator.pop(context);
              txtController.clear();
            },
            child: const Text("Đóng"),),

            MaterialButton(onPressed: (){
              String newAddress = txtController.text;
              if(newAddress.isEmpty){

              }else{
                context.read<Restaurant>().updateDeliveryAdress(newAddress);
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Đã lưu địa chỉ mới',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Màu nền của hình tròn
                        ),
                        padding: const EdgeInsets.all(8), // Đảm bảo kích thước của hình tròn
                        child: const IconTheme(
                          data: IconThemeData(
                            color: Colors.green, // Màu của icon
                            size: 20,
                          ),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w900, // Trọng lượng phông chữ của icon
                            ),
                            child: Icon(
                              Icons.check,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(seconds: 2), // Thời gian hiển thị snackbar
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
              child: const Text("Lưu"),)
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text("Giao hàng tận nơi",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                ),),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: ()=>openLocationBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                    builder: (context,restaurant,child) => Text(
                      restaurant.deliveryAdress,
                      style: const TextStyle(
                        color: TColor.darkFontGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
