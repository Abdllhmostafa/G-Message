import 'package:flutter/material.dart';
import 'package:graduated_project/booking_views/Views/Dashboard_screen.dart';
import 'package:graduated_project/chat_views/LoginPage.dart';
import 'package:graduated_project/chat_views/RegisterPage.dart';
import 'package:graduated_project/chat_views/chat_home.dart';
import 'package:graduated_project/chat_views/chat_page.dart';
import 'package:graduated_project/chat_views/main_home_page.dart';
import 'package:graduated_project/chat_views/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduated_project/store_views/cart_view.dart';
import 'package:graduated_project/store_views/home_page_store.dart';
import 'package:graduated_project/store_views/product_view.dart';
import 'package:graduated_project/store_views/updete_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterView.id: (context) => RegisterView(),
          ChatView.id: (context) => ChatView(),
          MainHomeView.id: (context) => MainHomeView(),
          ChatHomeView.id: (context) => ChatHomeView(),
          UpdateProductPage.id: (context) => UpdateProductPage(),
          HomePageStore.id: (context) => HomePageStore(),
          Dashboard.id: (context) => Dashboard(),
          ProductView.id: (context) => ProductView(),
          CartView.id: (context) => CartView(),
        },
        home: splashScreen(),
      );
    });
  }
}
