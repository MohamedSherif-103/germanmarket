import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';
import 'package:germaniatek_market/shared/constant/constants.dart';

class ChangePassword extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            showSnackBar(context, "Password update succefully", true);
            Navigator.pop(context);
          }
          if (state is ChangePasswordFailureState) {
            showSnackBar(context, state.error, false);
          }
        },
        builder: (context, state) {
          LayoutCubit cubit = context.read<LayoutCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Change Password ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    controller: currentPasswordController,
                    onChanged: (value) {
                      // handle password change
                    },
                    decoration: const InputDecoration(
                      hintText: "Current Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      // handle new password change
                    },
                    decoration: const InputDecoration(
                      hintText: "New Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      if (currentPasswordController.text == currentPassword) {
                        if (newPasswordController.text.length >= 6) {
                          cubit.changePassword(
                              userCurrentPassword:
                                  currentPasswordController.text.trim(),
                              newPassword: newPasswordController.text.trim());
                        }
                        //else {
                        //   showSnackBar(context,
                        //       " Password must be at least 6 characters", false);
                        // }
                      } else {
                        showSnackBar(context,
                            "Plz verify current password and try again", false);
                      }
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: const Color(0xff2d4569),
                    textColor: Colors.white,
                    child: Text(state is ChangePasswordLoadingState
                        ? "loading ...."
                        : "Change Password"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnackBar(
      BuildContext context, String mssg, bool forSuccessOrFailure) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mssg),
      backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
    ));
  }
}
