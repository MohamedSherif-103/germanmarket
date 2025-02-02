import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:germaniatek_market/features/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:germaniatek_market/features/pages/favoriteview.dart';
import 'package:germaniatek_market/features/pages/homeview.dart';
import 'package:germaniatek_market/features/pages/profileview.dart';
import 'package:germaniatek_market/features/pages/storeView.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({
    super.key,
  });
  static String id = "MainHomeView";
  final List<Widget> views = [
    const Homeview(),
    const Storeview(),
    const Favoriteview(),
    const Profileview(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubitt =
              context.read<NavBarCubit>(); // عشان استخدمه براحتى فى اى مكان
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: views[cubitt.currentIndex],
            ),
            bottomNavigationBar: Container(
              height: 70,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: GNav(
                    onTabChange: (index) {
                      cubitt.ChangeCurrentIndex(index);
                    },
                    haptic: true, // haptic feedback
                    duration: const Duration(
                        milliseconds: 400), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.grey[800], // unselected icon color
                    activeColor: Colors.white, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor:
                        AppColor.primaryColor, // selected tab background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15), // navigation bar padding
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.store,
                        text: 'store',
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'favorite',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
