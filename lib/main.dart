import 'package:flutter/material.dart';
import 'package:germaniatek_market/features/auth/forgot_password.dart';
import 'package:germaniatek_market/features/auth/login_view.dart';
import 'package:germaniatek_market/features/auth/signup_view.dart';
import 'package:germaniatek_market/features/nav_bar/ui/main_home_view.dart';
import 'package:germaniatek_market/layout/screens/home_main_screen.dart';
import 'package:germaniatek_market/shared/constant/constants.dart';
import 'package:germaniatek_market/shared/network/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  token = CacheNetwork.getCacheData(key: 'token');
  currentPassword = CacheNetwork.getCacheData(key: 'password');
  print("My tokeen is $token");
  print("current password is $currentPassword");
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
        //  MainHomeView.id: (context) => MainHomeView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: const HomeMainscreen(),
      home: token != '' ? const HomeMainscreen() : const LoginView(),
    );
  }
}
