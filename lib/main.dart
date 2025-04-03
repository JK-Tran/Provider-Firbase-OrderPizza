import 'package:delivery_food/firebase_options.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>Restaurant()),
          ChangeNotifierProvider(create: (_) => Restaurant()),
        ],
     child:  const MyApp()

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.transparent,
      title: 'AQ Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "sans-serif",
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}


