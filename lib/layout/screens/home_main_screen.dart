import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/layout/cubit/layout_cubit.dart';

class HomeMainscreen extends StatelessWidget {
  const HomeMainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubiit = context.read<LayoutCubit>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Germania Market",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.teal,
            ),
            // كدا عشان أطبق اللوجيك عندى مهم جدا
            body: cubiit.layoutScreenLists[cubiit.bottomNavigationCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubiit.bottomNavigationCurrentIndex,
              onTap: (index) {
                cubiit.changeBottomNavIndex(index);
              },
              selectedItemColor: const Color(0xff2d4569),
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
