import 'package:formz/formz.dart';

enum DescriptionFormModelValidationError { empty, maximum }

class DescriptionFormModel extends FormzInput<String, DescriptionFormModelValidationError> {
  const DescriptionFormModel.pure([String value = '']) : super.pure(value);
  const DescriptionFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  DescriptionFormModelValidationError? validator(String value) {
    if (value.length == 0) {
      return DescriptionFormModelValidationError.empty;
    } else if (value.length > 1000) {
      return DescriptionFormModelValidationError.maximum;
    } else {
      return null;
    }
  }
}
