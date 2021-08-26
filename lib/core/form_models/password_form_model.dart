import 'package:formz/formz.dart';

enum PasswordFormModelValidationError { empty, invalid }

class PasswordFormModel extends FormzInput<String, PasswordFormModelValidationError> {
  const PasswordFormModel.pure([String value = '']) : super.pure(value);
  const PasswordFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordFormModelValidationError? validator(String value) {
    return value.length > 0
        ? value.length >= 6
            ? null
            : PasswordFormModelValidationError.invalid
        : PasswordFormModelValidationError.empty;
  }
}
