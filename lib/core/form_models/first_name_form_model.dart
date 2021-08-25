import 'package:formz/formz.dart';

enum FirstNameFormModelValidationError { empty }

class FirstNameFormModel extends FormzInput<String, FirstNameFormModelValidationError> {
  const FirstNameFormModel.pure([String value = '']) : super.pure(value);
  const FirstNameFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  FirstNameFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : FirstNameFormModelValidationError.empty;
  }
}
