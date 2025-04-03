import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/services/database/firestore.dart';
import 'package:delivery_food/view/acount/history_order_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String userID = auth.currentUser?.uid ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        title: const Text("Lịch sử mua hàng", style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,)),
      ),


      body: Container(
        padding: const EdgeInsets.symmetric( vertical:15, horizontal:30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/order_bg.jpg'), // Đường dẫn đến ảnh nền
            fit: BoxFit.cover, // Đảm bảo ảnh nền được định dạng phù hợp với kích thước của Container
          ),
        ),
        //color: Colors.red.withOpacity(0.7),
        child: FutureBuilder<QuerySnapshot>(
          future: FirestoreService().orders.doc(userID).collection('orders').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                    value: null,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                    strokeWidth: 4,
                  ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text("Đã xảy ra lỗi")
              );
            } else {
              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final order = documents[index];
                  String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(order['date'].toDate());
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: TColor.whiteColor.withOpacity(0.97),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: TColor.fontGrey.withOpacity(0.3), // Màu của shadow
                            spreadRadius: 1, // Bán kính mà shadow phải mở rộng
                            blurRadius: 5, // Độ mờ của shadow
                            offset: const Offset(0,2), // Độ dời của shadow
                          ),
                        ],
                      ),
                      child : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                        child: ListTile(
                            onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryOrderDetails(orderID: order['orderID'])));
                            },
                            title: Text(
                              "Order ID: ${order['orderID']}",
                              style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tổng tiền: ${order['total']}",
                                  style: const TextStyle(
                                    color: TColor.darkFontGrey,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text("Ngày đặt: $formattedDate",
                                  style: const TextStyle(
                                    color: TColor.darkFontGrey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                              ),
                            )
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
