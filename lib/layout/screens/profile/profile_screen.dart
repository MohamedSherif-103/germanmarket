import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';
import 'package:germaniatek_market/layout/screens/change_password/change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getProfileUserData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = context.read<LayoutCubit>();
          if (cubit.profileData == null) cubit.getProfileUserData();
          return Scaffold(
            body: cubit.profileData != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      width: double.infinity,
                      child: Column(
                        children: [
                          // Image.network(cubit.profileData!.image!.toString()),
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "https://e7.pngegg.com/pngimages/1001/767/png-clipart-two-person-in-front-of-laptop-computer-illustration-training-learning-student-education-plan-technology-blue-electronics-thumbnail.png",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            cubit.profileData!.name!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            cubit.profileData!.email!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           ChangePassword()));
                            },
                            color: const Color(0xff2d4569),
                            textColor: Colors.white ,
                            child: const Text("Editing Profile"),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
