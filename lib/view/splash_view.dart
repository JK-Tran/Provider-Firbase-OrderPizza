import 'package:delivery_food/common/images.dart';
import 'package:delivery_food/common/strings.dart';
import 'package:delivery_food/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    fireOpenApp();
  }

  void fireOpenApp() async{
    await Future.delayed(const Duration(seconds: 3));
    startApp();
  }

  void startApp(){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=> const AuthGate()), (route)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.redColor,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                          child: Image.asset(icAppLogo, height: 150)
                      ),

                      const SizedBox(height: 20),

                       Text(
                        appname,
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: TColor.whiteColor,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "@copyrightAnQuang-LTM1",
                  style: TextStyle(
                    color: TColor.whiteColor,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          )
      ),
    );
  }
}