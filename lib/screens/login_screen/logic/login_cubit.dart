import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String staticOtp = '1234';

  void sendOtp(String mobile) {
    emit(OtpLoading());
    Future.delayed(const Duration(milliseconds: 1500), () {
      emit(OtpSent());
    });
  }

  void verifyOtp(String otp) {
    emit(OtpLoading());
    if (otp.toLowerCase() == staticOtp.toLowerCase()) {
      emit(OtpVerified());
    } else {
      emit(OtpFailed("Please enter a valid Otp"));
    }
  }
}
