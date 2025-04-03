import 'package:delivery_food/view/login/login_view.dart';
import 'package:delivery_food/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return LoginView(onTap: togglePages);
   }else{
     return SignUpView(onTap: togglePages);
   }
  }
}
