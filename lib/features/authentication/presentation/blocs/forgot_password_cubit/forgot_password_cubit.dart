import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/form_models/email_form_model.dart';
import 'package:rogo/features/authentication/domain/usecases/send_password_reset_email_in_firebase_usecase.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final SendPasswordResetEmailInFirebaseUseCase _sendPasswordResetEmailInFirebaseUseCase;

  ForgotPasswordCubit({required SendPasswordResetEmailInFirebaseUseCase sendPasswordResetEmailInFirebaseUseCase})
      : _sendPasswordResetEmailInFirebaseUseCase = sendPasswordResetEmailInFirebaseUseCase,
        super(ForgotPasswordState());

  void updateEmail(String email) {
    final ef = EmailFormModel.dirty(email);
    emit(
      state.copyWith(
        errorMessage: '',
        email: ef.valid ? ef : EmailFormModel.pure(email),
        status: Formz.validate(
          [
            ef,
          ],
        ),
      ),
    );
  }

  void send() async {
    final ef = EmailFormModel.dirty(state.email.value);
    emit(
      state.copyWith(
        errorMessage: '',
        email: ef,
        status: Formz.validate(
          [
            ef,
          ],
        ),
      ),
    );

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await _sendPasswordResetEmailInFirebaseUseCase.call(Params(email: state.email.value));
      result.fold(
        (l) {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          if (l is ServerFailure) emit(state.copyWith(errorMessage: l.message));
        },
        (r) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
          emit(ForgotPasswordState());
        },
      );
    }
  }
}
