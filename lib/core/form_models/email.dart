import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.length <= 0) {
      return EmailValidationError.empty;
    } else {
      if (_emailRegExp.hasMatch(value)) {
        return null;
      } else {
        return EmailValidationError.invalid;
      }
    }
  }
}
