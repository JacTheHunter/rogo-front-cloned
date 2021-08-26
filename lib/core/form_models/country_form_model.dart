import 'package:formz/formz.dart';

enum CountryFormModelValidationError { empty }

class CountryFormModel extends FormzInput<int, CountryFormModelValidationError> {
  const CountryFormModel.pure([int value = 0]) : super.pure(value);
  const CountryFormModel.dirty([int value = 0]) : super.dirty(value);

  @override
  CountryFormModelValidationError? validator(int value) {
    return value > 0 ? null : CountryFormModelValidationError.empty;
  }
}
