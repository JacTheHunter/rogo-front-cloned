import 'package:formz/formz.dart';

enum BirthDateFormModelValidationError { empty }

class BirthDateFormModel extends FormzInput<String, BirthDateFormModelValidationError> {
  const BirthDateFormModel.pure([String value = '']) : super.pure(value);
  const BirthDateFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  BirthDateFormModelValidationError? validator(String value) {
    if (value.length > 9) {
      final dt = DateTime.tryParse(value);
      if (dt != null) {
        return null;
      }
    }

    return BirthDateFormModelValidationError.empty;
  }
}
