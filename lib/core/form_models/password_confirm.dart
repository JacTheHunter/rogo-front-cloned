import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum PasswordConfirmValidationError { invalid, empty }

class PaswordAndConfirmPassword extends Equatable {
  final String password;
  final String passwordConfirm;

  const PaswordAndConfirmPassword({this.password = '', this.passwordConfirm = ''});

  @override
  List<Object?> get props => [password, passwordConfirm];
}

class PasswordConfirm extends FormzInput<PaswordAndConfirmPassword, PasswordConfirmValidationError> {
  const PasswordConfirm.pure([PaswordAndConfirmPassword value = const PaswordAndConfirmPassword()]) : super.pure(value);
  const PasswordConfirm.dirty([PaswordAndConfirmPassword value = const PaswordAndConfirmPassword()])
      : super.dirty(value);

  @override
  PasswordConfirmValidationError? validator(PaswordAndConfirmPassword value) {
    if (value.passwordConfirm.length <= 0) {
      return PasswordConfirmValidationError.empty;
    } else {
      if (value.passwordConfirm == value.password) {
        return null;
      } else {
        return PasswordConfirmValidationError.invalid;
      }
    }
  }
}
