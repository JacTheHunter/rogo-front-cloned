import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/form_models/accept_policy_form_model.dart';
import 'package:rogo/core/form_models/email_form_model.dart';
import 'package:rogo/core/form_models/password_form_model.dart';
import 'package:rogo/core/form_models/password_confirm_form_model.dart';
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
    final ef = EmailFormModel.dirty(email);
    emit(
      state.copyWith(
        errorMessage: '',
        email: ef.valid ? ef : EmailFormModel.pure(email),
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
    final pf = PasswordFormModel.dirty(password);
    final pcf = PasswordConfirm.dirty(PaswordAndConfirmPasswordFormModel(
        password: password, passwordConfirm: state.passwordConfirm.value.passwordConfirm));
    emit(
      state.copyWith(
        errorMessage: '',
        password: pf.valid ? pf : PasswordFormModel.pure(password),
        passwordConfirm: pcf.valid
            ? pcf
            : PasswordConfirm.pure(PaswordAndConfirmPasswordFormModel(
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
        PaswordAndConfirmPasswordFormModel(password: state.password.value, passwordConfirm: passwordConfirm));
    emit(
      state.copyWith(
        errorMessage: '',
        passwordConfirm: pcf.valid
            ? pcf
            : PasswordConfirm.pure(
                PaswordAndConfirmPasswordFormModel(password: state.password.value, passwordConfirm: passwordConfirm)),
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
    final apf = AcceptPolicyFormModel.dirty(acceptPolicy ?? false);
    emit(
      state.copyWith(
        errorMessage: '',
        acceptPolicy: apf.valid ? apf : AcceptPolicyFormModel.pure(acceptPolicy ?? false),
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
    final ef = EmailFormModel.dirty(state.email.value);
    final pf = PasswordFormModel.dirty(state.password.value);
    final apf = AcceptPolicyFormModel.dirty(state.acceptPolicy.value);
    final pcf = PasswordConfirm.dirty(PaswordAndConfirmPasswordFormModel(
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
