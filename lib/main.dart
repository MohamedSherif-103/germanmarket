import 'package:flutter/material.dart';
import 'package:germaniatek_market/features/auth/forgot_password.dart';
import 'package:germaniatek_market/features/auth/login_view.dart';
import 'package:germaniatek_market/features/auth/signup_view.dart';
import 'package:germaniatek_market/features/nav_bar/ui/main_home_view.dart';
import 'package:germaniatek_market/features/pages/edit_name.dart';
import 'package:germaniatek_market/features/pages/my_order.dart';
import 'package:germaniatek_market/features/product_details/ui/product_details_view.dart';
import 'package:germaniatek_market/shared/constant/constants.dart';
import 'package:germaniatek_market/shared/network/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  token = CacheNetwork.getCacheData(key: 'token');
  print("My tokeen is $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GermaniaTek Market",
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.id: (context) => const LoginView(),
        ForgotPasswordView.id: (context) => const ForgotPasswordView(),
        SignupView.id: (context) => const SignupView(),
        MainHomeView.id: (context) => MainHomeView(),
        EditName.id: (context) => const EditName(),
        MyOrderView.id: (context) => const MyOrderView(),
        ProductDetailsView.id: (context) => const ProductDetailsView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: token != '' ? MainHomeView() : const LoginView(),
    );
  }
}
