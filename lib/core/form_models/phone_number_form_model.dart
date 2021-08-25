import 'package:formz/formz.dart';

enum PhoneNumberFormModelValidationError { invalid, empty }

class PhoneNumberFormModel extends FormzInput<String, PhoneNumberFormModelValidationError> {
  const PhoneNumberFormModel.pure([String value = '']) : super.pure(value);
  const PhoneNumberFormModel.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberFormModelValidationError? validator(String value) {
    if (value.length <= 0) {
      return PhoneNumberFormModelValidationError.empty;
    } else {
      return null;
      // if (value.length == 9) {
      // } else {
      //   return PhoneNumberValidationError.invalid;
      // }
    }
  }
}
