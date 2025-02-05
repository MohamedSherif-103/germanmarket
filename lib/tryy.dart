import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';

class Tryy extends StatefulWidget {
  const Tryy({super.key});

  @override
  State<Tryy> createState() => _TryyState();
}

class _TryyState extends State<Tryy> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getProfileUserData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubbitt = context.read<LayoutCubit>();
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile ppaagge "),
                backgroundColor: Colors.teal,
              ),
              body: cubbitt.profileData != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(cubbitt.profileData!.name!),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(cubbitt.profileData!.phone!),
                          const SizedBox(
                            height: 30,
                          ),
                          Image.network(cubbitt.profileData!.image!),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(cubbitt.profileData!.token!),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(cubbitt.profileData!.email!),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ));
        },
      ),
    );
  }
}
