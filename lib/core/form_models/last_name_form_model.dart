import 'package:formz/formz.dart';

enum LastNameFormModelValidationError { empty }

class LastNameFormModel extends FormzInput<String, LastNameFormModelValidationError> {
  const LastNameFormModel.pure([String value = '']) : super.pure(value);
  const LastNameFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  LastNameFormModelValidationError? validator(String value) {
    return value.length > 0 ? null : LastNameFormModelValidationError.empty;
  }
}
