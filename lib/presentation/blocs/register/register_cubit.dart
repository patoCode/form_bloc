import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSUbmit() {
    print("state $state");
  }

  void nameChanged(String value) {
    emit(state.copyWidth(
      name: value,
    ));
  }

  void emailChanged(String value) {
    emit(state.copyWidth(
      email: value,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWidth(
      password: value,
    ));
  }
}
