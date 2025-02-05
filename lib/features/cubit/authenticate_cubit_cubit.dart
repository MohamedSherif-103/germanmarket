import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:germaniatek_market/shared/network/local_network.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'authenticate_cubit_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(AuthenticateInitial());
  Future<bool> register(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image}) async {
    emit(RegisterLoadingState());
    try {
      Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/register"),
        headers: {"lang": "en"},
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'image': image
        },
      );
      // api عشان افك التشفير بتاع الجيسون  اللى جاى من
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        emit(RegisterSuccessState());
        return true;
      } else {
        emit(RegisterFailureState(message: responseBody['message']));
        return false;
      }
    } catch (e) {
      emit(RegisterFailureState(message: e.toString()));
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/login"),
        headers: {"lang": "en"},
        body: {'email': email, 'password': password},
      );
      print(response.body);
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        await CacheNetwork.insertToCash(
            key: 'token', value: responseBody['data']['token']);
        emit(LoginSuccessState());
        return true;
      } else {
        emit(LoginFailureState(message: responseBody['message']));
        return false;
      }
    } catch (e) {
      emit(LoginFailureState(message: e.toString()));
      return false;
    }
  }
}
