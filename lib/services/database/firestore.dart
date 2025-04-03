import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderToDatabase(String userID, String receipt, String total,String phone) async {
    //mỗi người dùng có duy nhất 1 collection 'orders',
    final userOrderDocRef = orders.doc(userID);

    // Lấy dữ liệu hiện tại của tài liệu con của userID (nếu có)
    final userOrderDoc = await userOrderDocRef.get();
    int currentOrderNumber = 0;

    // Nếu tài liệu con của userID đã tồn tại, lấy số đếm hiện tại
    if (userOrderDoc.exists) {
      final data = userOrderDoc.data() as Map<String, dynamic>;
      currentOrderNumber = data['count'] ?? 0;
    }

    // Tạo orderID dựa trên số đếm hiện tại của userID
    String orderID = 'HD0${currentOrderNumber + 1}';


    // mỗi userID sẽ có 1 colleciton order chứa thông tin của đơn hàng
    await userOrderDocRef.collection('orders').doc(orderID).set({
      'orderID': orderID,
      'userID': userID,
      'date': DateTime.now(),
      'total': total, // Thêm số điện thoại vào dữ liệu đơn hàng
    });

    // đém số orderID của mỗi userID
    await userOrderDocRef.set({
      'count': currentOrderNumber + 1,
    });

    //Tạo collection mới trong document của collection orders
    final CollectionReference details = userOrderDocRef.collection('orders').doc(orderID).collection('details');
    // Thêm dữ liệu vào collection details
    await details.add({
      'orderID': orderID,
      'date': DateTime.now(),
      'receipt': receipt,
      'total': total,
      'phone': phone, // Thêm số điện thoại vào dữ liệu hóa đơn
    });
  }
}



// // Lấy số tự tăng hiện tại từ Firestore
// DocumentSnapshot snapshot = await counter.doc('orderCounter').get();
// int currentOrderNumber = 0;
//
// if (snapshot.exists) {
//   Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?; // Định kiểu dữ liệu của data
//   if (data != null) {
//     currentOrderNumber = data['count'] ?? 0;
//   }
// }
//
// // Tạo orderID
// String orderID = 'HD0${currentOrderNumber + 1}';
//
// // Lưu thông tin đơn hàng vào Firestore
// await orders.doc(orderID).set({
//   'orderID': orderID,
//   'userID': userID,
//   'date': DateTime.now(),
//   'total': total,
// });
// Tạo một document reference cho userID




  // Future<void> saveReceiptToFirestore(String userId, List<CartItem> cart) async {
  //   try {
  //     // Tạo một danh sách sản phẩm để lưu thông tin của từng sản phẩm trong hóa đơn
  //     List<Map<String, dynamic>> products = [];
  //
  //     // Duyệt qua từng sản phẩm trong giỏ hàng (_cart)
  //     for (final cartItem in cart) {
  //       Map<String, dynamic> productInfo = {
  //         'name': cartItem.food.name,
  //         'quantity': cartItem.quantity,
  //         'price': cartItem.food.price,
  //         'selectedAddons': cartItem.selectedAddons, // Thêm thông tin selectedAddons
  //         // Thêm các trường khác của sản phẩm nếu cần
  //       };
  //
  //       // Thêm thông tin của sản phẩm vào danh sách
  //       products.add(productInfo);
  //     }
  //
  //     // Lưu thông tin của hóa đơn vào Firestore
  //     await FirebaseFirestore.instance
  //         .collection('users') // Collection chứa thông tin người dùng
  //         .doc(userId) // Tài liệu của người dùng
  //         .collection('receipts') // Collection chứa các hóa đơn của người dùng
  //         .add({
  //       'products'  : products, // Mảng chứa thông tin của các sản phẩm trong hóa đơn
  //       'timestamp': FieldValue.serverTimestamp(), // Thêm timestamp
  //     });
  //     print("Hóa đơn đã được lưu vào Firestore cho người dùng với ID: $userId");
  //   } catch (error) {
  //     print("Lỗi khi lưu hóa đơn vào Firestore: $error");
  //   }
  // }


