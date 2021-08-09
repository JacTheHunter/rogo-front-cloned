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
import 'package:rogo/features/authentication/domain/usecases/sign_in_with_email_and_password_in_firebase_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithEmailAndPasswordInFirebaseUseCase _signInWithEmailAndPasswordInFirebaseUseCase;

  LoginCubit({required SignInWithEmailAndPasswordInFirebaseUseCase signInWithEmailAndPasswordInFirebaseUseCase})
      : _signInWithEmailAndPasswordInFirebaseUseCase = signInWithEmailAndPasswordInFirebaseUseCase,
        super(LoginState());

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
          ],
        ),
      ),
    );
  }

  void updatePassword(String password) {
    final pf = Password.dirty(password);
    emit(
      state.copyWith(
        errorMessage: '',
        password: pf.valid ? pf : Password.pure(password),
        status: Formz.validate(
          [
            pf,
            state.email,
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
    emit(
      state.copyWith(
          errorMessage: '',
          email: ef,
          password: pf,
          status: Formz.validate([
            ef,
            pf,
          ])),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final userProfileResult = await _signInWithEmailAndPasswordInFirebaseUseCase
          .call(Params(email: state.email.value, password: state.password.value));
      userProfileResult.fold(
        (l) {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          if (l is ServerFailure) emit(state.copyWith(errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          sl<NavigatorService>().popUNtilFirst();
          emit(LoginState());
        },
      );
    }
  }
}
