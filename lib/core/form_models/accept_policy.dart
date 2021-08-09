import 'package:formz/formz.dart';

enum AcceptPolicyValidationError { empty }

class AcceptPolicy extends FormzInput<bool, AcceptPolicyValidationError> {
  const AcceptPolicy.pure([bool value = false]) : super.pure(value);
  const AcceptPolicy.dirty([bool value = false]) : super.dirty(value);

  @override
  AcceptPolicyValidationError? validator(bool value) {
    if (!value) {
      return AcceptPolicyValidationError.empty;
    } else {
      return null;
    }
  }
}
