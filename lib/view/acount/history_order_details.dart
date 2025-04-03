import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/services/database/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryOrderDetails extends StatelessWidget {
  final String orderID;
  const HistoryOrderDetails({super.key, required this.orderID});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String userID = auth.currentUser?.uid ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        title: const Text("Chi tiết đơn hàng",
            style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/order_bg.jpg'), // Đường dẫn đến ảnh nền
            fit: BoxFit.cover, // Đảm bảo ảnh nền được định dạng phù hợp với kích thước của Container
          ),
        ),
        padding: const EdgeInsets.symmetric( vertical:15, horizontal:30),
        child: FutureBuilder(
          future:  FirestoreService().orders
              .doc(userID)
              .collection('orders')
              .doc(orderID)
              .collection('details')
              .get(),
           builder: (context,snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return const Center(
                   child: CircularProgressIndicator(
                     value: null,
                     valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                     strokeWidth: 4,
                   )
               );
             } else if (snapshot.hasError) {
               return Text('Đã xảy ra lỗi: ${snapshot.error}');
             }else{
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                //hiển thị chi details
               return ListView.builder(
                   itemCount: documents.length,
                   itemBuilder: (context,index){
                     final detail = documents[index];
                     return ListTile(
                       title: Padding(
                         padding: const EdgeInsets.only(bottom: 15),
                         child: Text( "Order ID: ${detail['orderID']}",
                           textAlign: TextAlign.center,
                           style: const TextStyle(
                               color: Colors.deepOrange,
                               fontSize: 24,
                               fontWeight: FontWeight.w500
                           ),
                         ),
                       ),
                       subtitle: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                         decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.95),
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(
                               color: Colors.grey.withOpacity(0.8),
                               width: 1,
                           )

                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const SizedBox(height: 20),
                             Text('${detail['receipt']}',
                               style: const TextStyle(
                                   color: TColor.darkFontGrey,
                                   fontSize: 22,
                                   fontWeight: FontWeight.w500
                               ),
                             ),
                             Text("Số điện thoại: ${detail['phone']}",
                             style: const TextStyle(
                               fontSize: 22,
                               color: TColor.darkFontGrey,
                               fontWeight: FontWeight.w500
                             ),),
                           ],
                         ),
                       ),
                     );
                   }
               );
             }
           }
        ),
      )
    );
  }
}
