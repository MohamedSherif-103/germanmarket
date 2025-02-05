import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:germaniatek_market/layout/screens/cart/cart_screen.dart';
import 'package:germaniatek_market/layout/screens/cateogrey/cateogrey_screen.dart';
import 'package:germaniatek_market/layout/screens/favorite/favorite_screen.dart';
import 'package:germaniatek_market/layout/screens/home/home_screen.dart';
import 'package:germaniatek_market/layout/screens/profile/profile_screen.dart';
import 'package:germaniatek_market/models/user_model.dart';
import 'package:germaniatek_market/shared/constant/constants.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutCubitInitial());
  int bottomNavigationCurrentIndex = 0;
  List<Widget> layoutScreenLists = [
    const HomeScreen(),
    const CateogreyScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  void changeBottomNavIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(IndexChanged());
  }

  UserModel? profileData;
  Future<void> getProfileUserData() async {
    emit(GetProfileLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/profile"),
        headers: {
          "Authorization": token!,
          "lang": "en",
        },
      );
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        profileData = UserModel.fromJSON(data: responseData['data']);
        emit(GetProfileSuccessState());
        print("My Response is $responseData");
      } else {
        emit(GetProfileFailureState(error: responseData['message']));
        print("My Response is $responseData");
      }
    } catch (e) {
      emit(GetProfileFailureState(error: e.toString()));
    }
  }
}

// LayoutCubit cubbitt = context.read<LayoutCubit>();
// cubbitt.profileData!.name! 