part of 'resetpassword_cubit.dart';

@immutable
sealed class ResetpasswordState {}

final class ResetpasswordInitial extends ResetpasswordState {}

final class ResetpasswordLoading extends ResetpasswordState {}

final class ResetpasswordFailed extends ResetpasswordState {

  final String error;

  ResetpasswordFailed(this.error);
}


