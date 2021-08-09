import 'package:formz/formz.dart';

enum BirthDateValidationError { empty }

class BirthDate extends FormzInput<String, BirthDateValidationError> {
  const BirthDate.pure([String value = '']) : super.pure(value);
  const BirthDate.dirty([String value = '']) : super.dirty(value);

  @override
  BirthDateValidationError? validator(String value) {
    if (value.length > 9) {
      final dt = DateTime.tryParse(value);
      if (dt != null) {
        return null;
      }
    }

    return BirthDateValidationError.empty;
  }
}
