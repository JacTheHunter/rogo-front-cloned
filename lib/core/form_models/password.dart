import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    return value.length > 0
        ? value.length >= 6
            ? null
            : PasswordValidationError.invalid
        : PasswordValidationError.empty;
  }
}
