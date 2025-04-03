import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //lấy user hiện tại
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  // đăng nhập
  Future<UserCredential> signInWithEmailPassword(String email,password) async{
    try{
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email : email,
              password: password
          );
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  // đăng ký
  Future<UserCredential> signUpWithEmailPassword(String email,password) async{
    try{
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email : email,
          password: password
      );
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future<String?> getCurrentUserUsername() async {
    String? userID = _firebaseAuth.currentUser?.uid;
    if (userID != null) {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userID).get();
        return userSnapshot.get('username');
      } catch (e) {
        print("Error getting username: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> addUser(String userID, String username, String email, String password, String phone) async {
    await FirebaseFirestore.instance.collection('users').doc(userID).set({
      'userID': userID,
      'username': username,
      'email': email,
      'password': password,
      'phone': phone, // Thêm số điện thoại vào dữ liệu người dùng
    });
  }


  Future<String> getUserPhone(String userID) async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return userSnapshot['phone'] ?? ''; // Trả về số điện thoại, hoặc chuỗi rỗng nếu không tìm thấy
  }
  Future<bool> verifyPassword(String oldPassword) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        // Xác minh mật khẩu
        final credentials = EmailAuthProvider.credential(email: user.email!, password: oldPassword);
        await user.reauthenticateWithCredential(credentials);
        return true; // Mật khẩu hợp lệ
      } catch (e) {
        print("Lỗi: $e");
        return false; // Mật khẩu không hợp lệ
      }
    } else {
      throw Exception("No user found");
    }
  }
  Future<void> updatePasswordInFirestore(String userID, String newPassword) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userID).update({
        'password': newPassword,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    // Kiểm tra xem mật khẩu cũ có khớp không
    bool isVerified = await verifyPassword(oldPassword);
    if (isVerified) {
      // Nếu mật khẩu cũ hợp lệ, tiến hành đổi mật khẩu
      try {
        // Cập nhật mật khẩu trong Authentication
        await _firebaseAuth.currentUser!.updatePassword(newPassword);
        // Cập nhật mật khẩu trong Firestore
        await updatePasswordInFirestore(_firebaseAuth.currentUser!.uid, newPassword);
      } catch (e) {
        throw Exception("Lỗi: $e");
      }
    } else {
      throw Exception("mật khẩu cũ không khớp");
    }
  }
  // Future<void> updatePasswordAndUsername(String userID, String newPassword, String newUsername) async {
  //   try {
  //     // Cập nhật mật khẩu trong Firebase Authentication
  //     await _firebaseAuth.currentUser!.updatePassword(newPassword);
  //
  //     // Cập nhật tên người dùng trong Firestore
  //     await FirebaseFirestore.instance.collection('users').doc(userID).update({
  //       'password': newPassword,
  //       'username': newUsername,
  //     });
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }



  //đăng xuất
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }

}