import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/features/auth/login_view.dart';
import 'package:germaniatek_market/features/cubit/authenticate_cubit_cubit.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';
import 'package:germaniatek_market/widgwts/custom_row.dart';
import 'package:germaniatek_market/widgwts/custom_text_button.dart';
import 'package:germaniatek_market/widgwts/custom_textformfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static String id = "SignupView";

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final String image =
      "https://creativeschoolarabia.com/wp-content/uploads/2019/02/Moon-lunar-full-moon-amazing-creative-school-arabia-%D8%B5%D9%88%D8%B1%D8%A9-%D9%84%D9%84%D9%82%D9%85%D8%B1-%D8%AA%D8%B5%D9%88%D9%8A%D8%B1-%D8%A7%D9%84%D9%82%D9%85%D8%B1-%D8%AA%D8%B5%D9%88%D9%8A%D8%B1-%D9%81%D9%88%D8%AA%D9%88%D8%BA%D8%B1%D8%A7%D9%81%D9%8A-%D8%B5%D9%88%D8%B1%D8%A9-%D9%84%D9%84%D9%82%D9%85%D8%B1-%D9%85%D9%83%D9%88%D9%86%D8%A9-%D9%85%D9%86-50-%D8%A7%D9%84%D9%81-%D8%B5%D9%88%D8%B1%D8%A9-%D8%AA%D9%85-%D8%AA%D8%AC%D9%85%D9%8A%D8%B9%D9%87%D8%A7-%D8%A8%D8%A7%D9%84%D9%81%D9%88%D8%AA%D9%88%D8%B4%D9%88%D8%A82.jpg";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticateCubit(),
      child: BlocConsumer<AuthenticateCubit, AuthenticateState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(child: Text("Success Register"))));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginView()));
          } else if (state is RegisterFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(child: Text(state.message)),
              backgroundColor: const Color.fromARGB(255, 186, 117, 112),
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
                      "Welcome To Our Market",
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blackColor),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          child: Center(
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      )),
                    ),
                    Card(
                      margin: const EdgeInsets.all(16),
                      color: AppColor.whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                                controller: _nameController,
                                hintText: "Name",
                                keyboardType: TextInputType.name),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                                controller: _phoneController,
                                hintText: "Phone",
                                keyboardType: TextInputType.phone),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                                controller: _emailController,
                                suffix: const Icon(Icons.email_outlined),
                                hintText: "Email",
                                keyboardType: TextInputType.emailAddress),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              isSecure: isPasswordHidden,
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordHidden = !isPasswordHidden;
                                  });
                                },
                                icon: Icon(isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            state is RegisterLoadingState
                                ? const CircularProgressIndicator()
                                : CustomRow(
                                    text: "SignUp",
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubbitt.register(
                                          name: _nameController.text,
                                          phone: _phoneController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          image: image,
                                        );
                                        // Navigator.pushNamed(
                                        //     context, "LoginView");
                                      }
                                      // else {
                                      //   Scaffold.of(context).showSnackBar(
                                      //     SnackBar(
                                      //       content: Text("All fields are required"),
                                      //     ),
                                      //   );
                                      // }
                                    },
                                  ),
                            const SizedBox(height: 20),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 6),
                                CustomTextButton(
                                  text: "Login",
                                  onTap: () {
                                    Navigator.pushNamed(context, "LoginView");
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _nameController.dispose();
  //   super.dispose();
  // }
}
