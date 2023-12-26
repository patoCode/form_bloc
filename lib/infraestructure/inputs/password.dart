import 'package:formz/formz.dart';

// * Esta enumeracion represanta lo que controlaremos del input encuestion
enum PaswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Pasword extends FormzInput<String, PaswordError> {
  // * Pure indica que el valor es un valor PURO o INICIAL
  const Pasword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // * DIRTY representa un valor modificado por el usuario "SUCIO"
  // * Aca se recomienda que el parametro value sea OBLIGATORIO
  const Pasword.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PaswordError? validator(String value) {
    // * ca debemos llenar las reglas de validacion
    if (value.isEmpty || value.trim().isEmpty) return PaswordError.empty;
    if (value.length < 6) return PaswordError.length;
    return null;
  }
}
