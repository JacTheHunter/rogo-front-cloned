import 'package:formz/formz.dart';

enum DateFormModelValidationError { empty }

class DateFormModel extends FormzInput<String, DateFormModelValidationError> {
  const DateFormModel.pure([String value = '']) : super.pure(value);
  const DateFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  DateFormModelValidationError? validator(String value) {
    if (value.length > 9) {
      final dt = DateTime.tryParse(value);
      if (dt != null) {
        return null;
      }
    }

    return DateFormModelValidationError.empty;
  }
}
