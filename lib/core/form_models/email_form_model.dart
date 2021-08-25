import 'package:formz/formz.dart';

enum EmailFormModelValidationError { invalid, empty }

class EmailFormModel extends FormzInput<String, EmailFormModelValidationError> {
  const EmailFormModel.pure([String value = '']) : super.pure(value);
  const EmailFormModel.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailFormModelValidationError? validator(String value) {
    if (value.length <= 0) {
      return EmailFormModelValidationError.empty;
    } else {
      if (_emailRegExp.hasMatch(value)) {
        return null;
      } else {
        return EmailFormModelValidationError.invalid;
      }
    }
  }
}
