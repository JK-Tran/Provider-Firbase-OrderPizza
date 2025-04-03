
import 'package:delivery_food/common/color_extension.dart';
import 'package:delivery_food/common_widget/round_button.dart';
import 'package:delivery_food/database_helper/database_helper.dart';
import 'package:delivery_food/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final void Function()? onTap;
  const LoginView({super.key,required this.onTap});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isLogin = false;
  bool isShow = false;
  bool isLoading = false;
  final RegExp emailRegex =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final db = DatabaseHelper();

  login()async{
    final auService = AuthService();
    try{
      await auService.signInWithEmailPassword(txtEmailController.text, txtPasswordController.text);
    }
    catch (e){
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Sai tài khoản hoặc mật khẩu"),
          ));
    }

  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body:SafeArea(
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
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width*0.5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Đăng nhập",
                          style: TextStyle(
                              color: TColor.whiteColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),


                    SizedBox(height: media.width*0.1),
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
                    SizedBox(height: media.width*0.2),

                    RoundButton(title: "Đăng nhập",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          login();
                        }
                      },

                    ),

                    SizedBox(height: media.width*0.1),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TextButton(onPressed: (){
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context)=>const SignUpView()));
                        // },
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Bạn đã có tài khoản?",
                              style: TextStyle(
                                  color: TColor.placeholder,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text("Đăng ký",
                                style: TextStyle(
                                    color: TColor.redColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isLogin? const Text("Tài khoản hoặc mật khẩu không đúng",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                    ) : const SizedBox(),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// setState(() {
//   isLoading = true; // Hiển thị CircularProgressIndicator
// });
// var respone = await db.login(Users(
//     usrEmail: txtEmailController.text,
//     usrPassword: txtPasswordController.text,
//     usrFullName: ''));
// if(!mounted) {
//   return;
// }
// setState(() {
//   isLoading = false; // Ẩn CircularProgressIndicator sau khi đăng nhập hoàn thành
// });
// if(respone == true){
//   Navigator.push(context, MaterialPageRoute(builder: (context) => const MainTabView()));
// }
// else{
//   setState(() {
//     isLogin = true;
//   });
// }
