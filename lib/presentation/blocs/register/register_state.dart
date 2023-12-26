part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String name;
  final String email;
  final String password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.name = '',
    this.email = '',
    this.password = '',
  });

  RegisterFormState copyWidth({
    FormStatus? formStatus,
    String? name,
    String? email,
    String? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, name, email, password];
}

final class RegisterInitial extends RegisterFormState {}
