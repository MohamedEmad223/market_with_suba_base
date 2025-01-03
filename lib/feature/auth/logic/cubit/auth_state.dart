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

final class GoogleSignInLoading extends AuthState {}

final class GoogleSignInSuccess extends AuthState {}

final class GoogleSignInFailed extends AuthState {

  GoogleSignInFailed();
}

final class AddUserDataLoading extends AuthState {}

final class AddUserDataSuccess extends AuthState {}

final class AddUserDataFailed extends AuthState {
  final String error;
  AddUserDataFailed(this.error);
}

final class GetUserDataLoading extends AuthState {}

final class GetUserDataSuccess extends AuthState {
  final UserDataModel userDataModel;
  GetUserDataSuccess(this.userDataModel);
}

final class GetUserDataFailed extends AuthState {
  final String error;
  GetUserDataFailed(this.error);
}
