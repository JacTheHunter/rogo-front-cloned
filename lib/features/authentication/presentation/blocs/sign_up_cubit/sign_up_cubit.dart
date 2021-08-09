import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/form_models/accept_policy.dart';
import 'package:rogo/core/form_models/email.dart';
import 'package:rogo/core/form_models/password.dart';
import 'package:rogo/core/form_models/password_confirm.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/features/authentication/domain/usecases/create_user_with_email_and_password_in_firebase_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SingUpState> {
  final CreateUserWithEmailAndPasswordInFirebaseUseCase _createUserWithEmailAndPasswordInFirebaseUseCase;

  SignUpCubit(
      {required CreateUserWithEmailAndPasswordInFirebaseUseCase createUserWithEmailAndPasswordInFirebaseUseCase})
      : _createUserWithEmailAndPasswordInFirebaseUseCase = createUserWithEmailAndPasswordInFirebaseUseCase,
        super(SingUpState());

  void updateEmail(String email) {
    final ef = Email.dirty(email);
    emit(
      state.copyWith(
        errorMessage: '',
        email: ef.valid ? ef : Email.pure(email),
        status: Formz.validate(
          [
            ef,
            state.password,
            state.passwordConfirm,
            state.acceptPolicy,
          ],
        ),
      ),
    );
  }

  void updatePassword(String password) {
    final pf = Password.dirty(password);
    final pcf = PasswordConfirm.dirty(
        PaswordAndConfirmPassword(password: password, passwordConfirm: state.passwordConfirm.value.passwordConfirm));
    emit(
      state.copyWith(
        errorMessage: '',
        password: pf.valid ? pf : Password.pure(password),
        passwordConfirm: pcf.valid
            ? pcf
            : PasswordConfirm.pure(PaswordAndConfirmPassword(
                password: password, passwordConfirm: state.passwordConfirm.value.passwordConfirm)),
        status: Formz.validate(
          [
            pf,
            pcf,
            state.email,
            state.acceptPolicy,
          ],
        ),
      ),
    );
  }

  void updatePasswordConfirm(String passwordConfirm) {
    final pcf = PasswordConfirm.dirty(
        PaswordAndConfirmPassword(password: state.password.value, passwordConfirm: passwordConfirm));
    emit(
      state.copyWith(
        errorMessage: '',
        passwordConfirm: pcf.valid
            ? pcf
            : PasswordConfirm.pure(
                PaswordAndConfirmPassword(password: state.password.value, passwordConfirm: passwordConfirm)),
        status: Formz.validate(
          [
            pcf,
            state.email,
            state.password,
            state.acceptPolicy,
          ],
        ),
      ),
    );
  }

  void updateAcceptPolicy(bool? acceptPolicy) {
    final apf = AcceptPolicy.dirty(acceptPolicy ?? false);
    emit(
      state.copyWith(
        errorMessage: '',
        acceptPolicy: apf.valid ? apf : AcceptPolicy.pure(acceptPolicy ?? false),
        status: Formz.validate(
          [
            apf,
            state.email,
            state.password,
            state.passwordConfirm,
          ],
        ),
      ),
    );
  }

  void onsecurePassword() {
    final val = !state.obsecurePassword;
    emit(state.copyWith(obsecurePassword: val));
  }

  void onsecurePasswordConfirm() {
    emit(state.copyWith(obsecurePasswordConfirm: !state.obsecurePasswordConfirm));
  }

  void send() async {
    final ef = Email.dirty(state.email.value);
    final pf = Password.dirty(state.password.value);
    final apf = AcceptPolicy.dirty(state.acceptPolicy.value);
    final pcf = PasswordConfirm.dirty(PaswordAndConfirmPassword(
        password: state.password.value, passwordConfirm: state.passwordConfirm.value.passwordConfirm));
    emit(
      state.copyWith(
          errorMessage: '',
          email: ef,
          password: pf,
          passwordConfirm: pcf,
          acceptPolicy: apf,
          status: Formz.validate([
            ef,
            pf,
            pcf,
            apf,
          ])),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final userProfileResult = await _createUserWithEmailAndPasswordInFirebaseUseCase
          .call(Params(email: state.email.value, password: state.password.value));
      userProfileResult.fold(
        (l) {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          if (l is ServerFailure) emit(state.copyWith(errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          sl<NavigatorService>().popUNtilFirst();
          emit(SingUpState());
        },
      );
    }
  }
}
