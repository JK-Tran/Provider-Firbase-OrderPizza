import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/round_button.dart';
import 'package:delivery_food/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class SignUpView extends StatefulWidget {
  final void Function()? onTap;
  const SignUpView({super.key,required this.onTap});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  TextEditingController txtSDTController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  final RegExp emailRegex =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isShow = false;
  //đăng kí firebase

  void signUp() async {
    final BuildContext contextRef = context; // Lưu tham chiếu đến context

    final authService = AuthService();
    try {
      // Thực hiện đăng kí và nhận về userID
      final UserCredential userCredential = await authService.signUpWithEmailPassword(
        txtEmailController.text,
        txtPasswordController.text,
      );
      // Lấy userID từ userCredential
      final userID = userCredential.user?.uid;

      // Thêm thông tin người dùng vào Firestore
      if (userID != null && mounted) { // Kiểm tra xem context và widget có còn tồn tại không
        await authService.addUser(
            userID,
            txtUsernameController.text.trim(),
            txtEmailController.text.trim(),
            txtPasswordController.text.trim(),
            txtSDTController.text.trim(),
        );
      }
    } catch (e) {
      if (mounted) { // Kiểm tra xem context và widget có còn tồn tại không
        showDialog(
          context: contextRef, // Sử dụng contextRef
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    txtPasswordController.dispose();
    txtEmailController.dispose();
    txtUsernameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign_up_bg2.jpg"), // Thay đổi đường dẫn cho phù hợp với hình ảnh bạn sử dụng
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: media.width*0.45),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đăng ký",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Tên tài khoản",
                            style: TextStyle(
                                color: TColor.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          TextFormField(
                            controller: txtUsernameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Nhập họ tên",
                              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 20),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Họ tên khôn được trống";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: TColor.whiteColor),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: const Color(0xffE2E2E2),
                          )
                        ],
                      ),
                      SizedBox(height: media.width*0.07),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Số điện thoại",
                            style: TextStyle(
                                color: TColor.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          TextFormField(
                            controller: txtSDTController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Nhập số điện thoại",
                              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 20),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Số điện thoại không được trống";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: TColor.whiteColor),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: const Color(0xffE2E2E2),
                          )
                        ],
                      ),
                      SizedBox(height: media.width*0.07),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                                color: TColor.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),

                          TextFormField(
                            controller: txtEmailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Nhập email",
                              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 20),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email không được trống";
                              } else if (!emailRegex.hasMatch(value)) {
                                return "Email không hợp lệ";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: TColor.whiteColor),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: const Color(0xffE2E2E2),
                          )
                        ],
                      ),

                      SizedBox(height: media.width*0.07),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                                color: TColor.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          TextFormField(
                            controller: txtPasswordController,
                            obscureText: !isShow,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    isShow = !isShow;
                                  });
                                },
                                icon: Icon(
                                  !isShow ? Icons.visibility_off : Icons.visibility,
                                  color: TColor.textTittle,
                                ),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Nhập password",
                              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 20),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password không được trống";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: TColor.whiteColor),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: const Color(0xffE2E2E2),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),

                      RoundButton(title: "Đăng kí",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            signUp();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.green), // Biểu tượng check
                                    SizedBox(width: 8), // Khoảng cách giữa biểu tượng và văn bản
                                    Text(
                                      'Đăng kí thành công',
                                      style: TextStyle(
                                        fontSize: 18, // Kích thước font
                                        fontWeight: FontWeight.bold, // Độ đậm của font
                                        color: Colors.green, // Màu sắc của văn bản
                                      ),
                                    ),
                                  ],
                                ),
                                duration: Duration(seconds: 4),
                              ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Đã có tài khoản?",
                                style: TextStyle(
                                    color: TColor.whiteColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text("Đăng nhập",
                                  style: TextStyle(
                                      color: TColor.redColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // void handleSignUp() {
  //   if (formKey.currentState!.validate()) {
  //     if (txtUsernameController.text.isEmpty ||
  //         txtEmailController.text.isEmpty ||
  //         txtPasswordController.text.isEmpty) {
  //       // Nếu có trường nào đó trong form đăng kí trống, không thực hiện đăng kí và hiển thị thông báo lỗi
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin đăng kí')),
  //       );
  //     } else {
  //       // Nếu tất cả các trường đều có giá trị, thực hiện đăng kí
  //       final db = DatabaseHelper();
  //       db.signup(Users(
  //         usrEmail: txtUsernameController.text,
  //         usrPassword: txtPasswordController.text,
  //         usrFullName: txtUsernameController.text,
  //       )).whenComplete(() {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => const LoginView()),
  //         );
  //       });
  //     }
  //   }
  // }
}
// final db = DatabaseHelper();
// db.signup(Users(
//   usrFullName: txtUsernameController.text,
//   usrEmail: txtEmailController.text,
//   usrPassword: txtPasswordController.text,
// )).whenComplete(() {
//   // Show success message
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text('Đăng kí thành công'),
//       duration: Duration(seconds: 2), // Adjust the duration as needed
//     ),
//   );
//   // Navigate to login view
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const LoginView(onTap:null)),
//   );
// });