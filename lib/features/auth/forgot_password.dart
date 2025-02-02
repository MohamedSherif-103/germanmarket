import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/custom_textformfield.dart';
import 'package:germaniatek_market/widgwts/elevated_button.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static String id = "ForgotPasswordView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Enter your Email to Reset Password",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  const CustomTextFormField(
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomElevated(
                    text: 'Submit',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
