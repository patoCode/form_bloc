import 'package:formz/formz.dart';

// * Esta enumeracion represanta lo que controlaremos del input encuestion
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // * Pure indica que el valor es un valor PURO o INICIAL
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // * DIRTY representa un valor modificado por el usuario "SUCIO"
  // * Aca se recomienda que el parametro value sea OBLIGATORIO
  const Username.dirty(String value) : super.dirty(value);

  // * Metodo que permite obtener los mensajes de ERROR si existieran
  String? get errorMessage {
    if (isValid || isPure) return null;
    // * displayError es el metodo que permite desplegar los mensajes de error
    if (displayError == UsernameError.empty) {
      return 'El campo es requerido input';
    }
    if (displayError == UsernameError.length) {
      return 'Se necesitan al menos 6 caracteres input';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    // * ca debemos llenar las reglas de validacion
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;
    return null;
  }
}
