import 'package:delivery_food/services/auth/login_or_register.dart';
import 'package:delivery_food/view/main_tabview/main_tabview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const MainTabView();
          }else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
