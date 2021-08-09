import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid, empty }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberValidationError? validator(String value) {
    if (value.length <= 0) {
      return PhoneNumberValidationError.empty;
    } else {
      if (value.length == 9) {
        return null;
      } else {
        return PhoneNumberValidationError.invalid;
      }
    }
  }
}
