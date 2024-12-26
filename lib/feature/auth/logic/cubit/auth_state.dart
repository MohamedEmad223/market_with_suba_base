part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailed extends AuthState {
  final String error;
  LoginFailed(this.error);
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailed extends AuthState {
  final String error;
  SignupFailed(this.error);
}
