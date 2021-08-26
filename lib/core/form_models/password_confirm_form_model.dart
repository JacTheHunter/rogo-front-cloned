import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum PasswordConfirmFormModelValidationError { invalid, empty }

class PaswordAndConfirmPasswordFormModel extends Equatable {
  final String password;
  final String passwordConfirm;

  const PaswordAndConfirmPasswordFormModel({this.password = '', this.passwordConfirm = ''});

  @override
  List<Object?> get props => [password, passwordConfirm];
}

class PasswordConfirm extends FormzInput<PaswordAndConfirmPasswordFormModel, PasswordConfirmFormModelValidationError> {
  const PasswordConfirm.pure([PaswordAndConfirmPasswordFormModel value = const PaswordAndConfirmPasswordFormModel()])
      : super.pure(value);
  const PasswordConfirm.dirty([PaswordAndConfirmPasswordFormModel value = const PaswordAndConfirmPasswordFormModel()])
      : super.dirty(value);

  @override
  PasswordConfirmFormModelValidationError? validator(PaswordAndConfirmPasswordFormModel value) {
    if (value.passwordConfirm.length <= 0) {
      return PasswordConfirmFormModelValidationError.empty;
    } else {
      if (value.passwordConfirm == value.password) {
        return null;
      } else {
        return PasswordConfirmFormModelValidationError.invalid;
      }
    }
  }
}
