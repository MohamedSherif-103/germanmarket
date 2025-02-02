import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/custom_appbar.dart';
import 'package:germaniatek_market/widgwts/custom_textformfield.dart';
import 'package:germaniatek_market/widgwts/elevated_button.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});
  static String id = "EditName";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Name',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const CustomTextFormField(
                hintText: 'Enter Name',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevated(
                text: 'Update',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// AppBar(
          //   leading: IconButton(
          //       onPressed: () => Navigator.pop(context),
          //       icon: const Icon(
          //         Icons.arrow_back_ios,
          //         color: Colors.white,
          //       )),
          //   title: const Text(
          //     'Edit Name',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: Colors.blue,
          // ),
