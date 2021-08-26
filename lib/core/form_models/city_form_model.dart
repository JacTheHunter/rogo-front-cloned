import 'package:formz/formz.dart';

enum CityFormModelValidationError { empty }

class CityFormModel extends FormzInput<int, CityFormModelValidationError> {
  const CityFormModel.pure([int value = 0]) : super.pure(value);
  const CityFormModel.dirty([int value = 0]) : super.dirty(value);

  @override
  CityFormModelValidationError? validator(int value) {
    return value > 0 ? null : CityFormModelValidationError.empty;
  }
}
