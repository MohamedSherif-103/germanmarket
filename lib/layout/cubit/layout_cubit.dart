import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:germaniatek_market/layout/screens/cart/cart_screen.dart';
import 'package:germaniatek_market/layout/screens/cateogrey/cateogrey_screen.dart';
import 'package:germaniatek_market/layout/screens/favorite/favorite_screen.dart';
import 'package:germaniatek_market/layout/screens/home/home_screen.dart';
import 'package:germaniatek_market/layout/screens/profile/profile_screen.dart';
import 'package:germaniatek_market/models/banner_model.dart';
import 'package:germaniatek_market/models/cateogrey_model.dart';
import 'package:germaniatek_market/models/product_model.dart';
import 'package:germaniatek_market/models/user_model.dart';
import 'package:germaniatek_market/shared/constant/constants.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutCubitInitial());
  //                     =======================
  int bottomNavigationCurrentIndex = 0;
  List<Widget> layoutScreenLists = [
    HomeScreen(),
    const CateogreyScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  void changeBottomNavIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(IndexChanged());
  }

//                       ======================
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

//                      =======================
  List<BannerModel> banner = [];
  Future<void> getBannerData() async {
    emit(GetBannerLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/banners"),
        headers: {
          "lang": "en",
        },
      );
      var responseBodey = jsonDecode(response.body);
      if (responseBodey['status'] == true) {
        for (var item in responseBodey["data"]) {
          banner.add(BannerModel.fromJson(data: item));
        }
        emit(GetBannerSuccessState());
      } else {
        emit(GetBannerFailureState(error: responseBodey['message']));
      }
    } catch (e) {
      emit(GetBannerFailureState(error: e.toString()));
    }
  }

//                      =======================
  List<CateogreyModel> cateogrey = [];
  Future<void> getCateogreyData() async {
    emit(GetCategoriesLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/categories"),
        headers: {
          "lang": "en",
        },
      );
      var responseBodey = jsonDecode(response.body);
      if (responseBodey['status'] == true) {
        for (var item in responseBodey["data"]["data"]) {
          cateogrey.add(CateogreyModel.fromJson(data: item));
        }
        emit(GetCategoriesSuccessState());
      } else {
        emit(GetCategoriesFailureState(error: responseBodey['message']));
      }
    } catch (e) {
      emit(GetCategoriesFailureState(error: e.toString()));
    }
  }

//                      =======================
  List<ProductModel> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/home"),
        headers: {
          "Authorization": token!,
          "lang": "en",
        },
      );
      var responseBodey = jsonDecode(response.body);

      if (responseBodey['status'] == true) {
        for (var item in responseBodey["data"]["products"]) {
          products.add(ProductModel.fromJSON(data: item));
        }
        emit(GetProductsLoadingState());
      } else {
        emit(GetProductsFailureState(error: responseBodey['message']));
      }
    } catch (e) {
      emit(GetProductsFailureState(error: e.toString()));
    }
  }

// رخمه محتاجه تركيز
  List<ProductModel> filteredProducts = [];
  Future<void> filterProduct({required String input}) async {
    filteredProducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilterProductsSuccessState());
  }
}
