import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:form_bloc/infraestructure/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWidth(
          formStatus: FormStatus.validating,
          name: Username.dirty(state.name.value),
          password: Pasword.dirty(state.password.value)),
    );
    print("state $state");
  }

  void nameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWidth(
        name: username,
        // * aca debemos mandar todos los imputs para verificar todo el FORM y no solo algunos campos
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void emailChanged(String value) {
    emit(state.copyWidth(
      email: value,
    ));
  }

  void passwordChanged(String value) {
    final pass = Pasword.dirty(value);
    emit(
      state.copyWidth(
        password: pass,
        isValid: Formz.validate([state.name, pass]),
      ),
    );
  }
}
