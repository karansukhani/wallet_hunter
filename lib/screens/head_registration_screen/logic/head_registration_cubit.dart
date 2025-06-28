import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallet_hunter/screens/head_registration_screen/model/head_model_entity.dart';

part 'head_registration_state.dart';

class HeadRegistrationCubit extends Cubit<HeadRegistrationState> {
  HeadRegistrationCubit() : super(HeadRegistrationInitial());

  void submitForm(HeadModelEntity model) {
    emit(HeadSubmitting());
    Future.delayed(const Duration(seconds: 1), () {
      emit(HeadSubmitted());
    });
  }
}
