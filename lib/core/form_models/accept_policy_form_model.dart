import 'package:formz/formz.dart';

enum AcceptPolicyFormModelValidationError { empty }

class AcceptPolicyFormModel extends FormzInput<bool, AcceptPolicyFormModelValidationError> {
  const AcceptPolicyFormModel.pure([bool value = false]) : super.pure(value);
  const AcceptPolicyFormModel.dirty([bool value = false]) : super.dirty(value);

  @override
  AcceptPolicyFormModelValidationError? validator(bool value) {
    if (!value) {
      return AcceptPolicyFormModelValidationError.empty;
    } else {
      return null;
    }
  }
}
