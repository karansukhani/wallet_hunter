part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class OtpLoading extends LoginState {}

class OtpSent extends LoginState {}

class OtpVerified extends LoginState {}

class OtpFailed extends LoginState {
  final String message;

  OtpFailed(this.message);
}
