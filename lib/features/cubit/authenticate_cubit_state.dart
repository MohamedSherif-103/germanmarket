part of 'authenticate_cubit_cubit.dart';

@immutable
sealed class AuthenticateState {}

final class AuthenticateInitial extends AuthenticateState {}

final class RegisterLoadingState extends AuthenticateState {}

final class RegisterSuccessState extends AuthenticateState {}

final class RegisterFailureState extends AuthenticateState {
  final String message;

  RegisterFailureState({required this.message});
}

final class LoginLoadingState extends AuthenticateState {}

final class LoginSuccessState extends AuthenticateState {}

final class LoginFailureState extends AuthenticateState {
  final String message;

  LoginFailureState({required this.message});
}
