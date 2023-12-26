part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username name;
  final String email;
  final Pasword password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.name = const Username.pure(),
    this.email = '',
    this.password = const Pasword.pure(),
  });

  RegisterFormState copyWidth({
    FormStatus? formStatus,
    bool? isValid,
    Username? name,
    String? email,
    Pasword? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, isValid, name, email, password];
}

final class RegisterInitial extends RegisterFormState {}
