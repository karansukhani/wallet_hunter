part of 'head_registration_cubit.dart';

@immutable
sealed class HeadRegistrationState {}

class HeadRegistrationInitial extends HeadRegistrationState {}

class HeadSubmitting extends HeadRegistrationState {}

class HeadSubmitted extends HeadRegistrationState {}

class HeadSubmissionFailed extends HeadRegistrationState {
  final String error;

  HeadSubmissionFailed(this.error);
}
