import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/features/cubit/authenticate_cubit_cubit.dart';
import 'package:germaniatek_market/features/nav_bar/ui/main_home_view.dart';
import 'package:germaniatek_market/layout/screens/home_main_screen.dart';
import 'package:germaniatek_market/widgwts/custom_row.dart';
import 'package:germaniatek_market/widgwts/custom_text_button.dart';
import 'package:germaniatek_market/widgwts/custom_textformfield.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticateCubit(),
      child: BlocConsumer<AuthenticateCubit, AuthenticateState>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(child: Text(state.message)),
            ));
          }
        },
        builder: (context, state) {
          AuthenticateCubit cubbitt = context.read<AuthenticateCubit>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        "Welcome To Our market",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Card(
                        margin: const EdgeInsets.all(16),
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              CustomTextFormField(
                                controller: _emailController,
                                hintText: 'Enter Email',
                                suffix: const Icon(Icons.email),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              // const CustomTextFormField(
                              //   hintText: " PhoneNumber",
                              //   keyboardType: TextInputType.phone,
                              //   suffix: Icon(Icons.phone_android),
                              // ),
                              // const SizedBox(
                              //   height: 25,
                              // ),
                              CustomTextFormField(
                                controller: _passwordController,
                                isSecure: isPasswordHidden,
                                hintText: "Enter Password",
                                keyboardType: TextInputType.visiblePassword,
                                suffix: IconButton(
                                  icon: Icon(isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden = !isPasswordHidden;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomTextButton(
                                    text: 'Forgot Password',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "ForgotPasswordView");
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              state is LoginLoadingState
                                  ? const CircularProgressIndicator()
                                  : CustomRow(
                                      text: "Login",
                                      onPress: () async {
                                        if (_formKey.currentState!.validate() ==
                                            true) {
                                          bool isSuccess = await cubbitt.login(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                          if (isSuccess) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeMainscreen()));
                                          }
                                        }

                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             MainHomeView()));
                                      },
                                    ),

                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(width: 6),
                                  CustomTextButton(
                                    text: "Sign Up",
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "SignupView");
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // عشان لو الاسكرين اتمسحت ,ال controller ميفضلش شغال ويستهلك مال resources
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// ============================
// HapticFeedback.vibrate();
/*
 state is LoginLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                )
              :

*/