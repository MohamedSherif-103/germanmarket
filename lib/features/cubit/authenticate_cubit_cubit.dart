import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'authenticate_cubit_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(AuthenticateInitial());
  Future<void> register(
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
      } else {
        emit(RegisterFailureState(message: responseBody['message']));
      }
    } catch (e) {
      emit(RegisterFailureState(message: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/Login"),
        headers: {"lang": "en"},
        body: {'email': email, 'password': password},
      );
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(message: responseBody['message']));
      }
    } catch (e) {
      emit(LoginFailureState(message: e.toString()));
    }
  }
}
