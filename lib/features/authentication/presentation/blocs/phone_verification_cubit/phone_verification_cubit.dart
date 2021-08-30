import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../domain/usecases/update_phone_number_in_firebase_usecase.dart';
import '../create_account_cubit/create_account_cubit.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  final UpdatePhoneNumberInFirebaseUseCase _updatePhoneNumberInFirebaseUseCase;
  final CreateAccountCubit _createAccountCubit;

  PhoneVerificationCubit({
    required UpdatePhoneNumberInFirebaseUseCase updatePhoneNumberInFirebaseUseCase,
    required CreateAccountCubit createAccountCubit,
  })  : _updatePhoneNumberInFirebaseUseCase = updatePhoneNumberInFirebaseUseCase,
        _createAccountCubit = createAccountCubit,
        super(PhoneVerificationState(
          seconds: '00',
          code: '',
          verificationId: '',
        ));

  Timer _timer = Timer(Duration(seconds: 1), () {});

  void updateVerificationId(String verificationId) {
    emit(state.copyWith(verificationId: verificationId));

    restart();
  }

  void updateCode(String code) async {
    emit(state.copyWith(code: state.code + code));
    if (state.code.length == 6) {
      // Do something with code
      emit(state.copyWith(loading: true));
      final result = await _updatePhoneNumberInFirebaseUseCase.call(Params(
          phoneAuthCredential: PhoneAuthProvider.credential(
        verificationId: state.verificationId,
        smsCode: state.code,
      )));
      emit(state.copyWith(loading: false));
      result.fold((l) {
        if (l is ServerFailure) emit(state.copyWith(errorMessage: l.message));
      }, (r) {
        print('here');
        clearState();
        _createAccountCubit.finishPhoneConfirm();
        sl<NavigatorService>().pop();
      });
    }
  }

  void erraseCode() {
    if (state.code.length > 0) {
      emit(state.copyWith(code: state.code.substring(0, state.code.length - 1)));
    }
  }

  void resendCode() {
    emit(state.copyWith(loading: true));
    _createAccountCubit.onNext(withRedirect: false);
  }

  void runTimer() async {
    _timer.cancel();
    emit(state.copyWith(seconds: '60'));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int currentSeconds = int.parse(state.seconds);
      if (currentSeconds == 0) {
        _timer.cancel();
        return;
      }
      currentSeconds--;
      final secondsString = currentSeconds < 10 ? '0$currentSeconds' : '$currentSeconds';
      emit(state.copyWith(seconds: secondsString));
    });
  }

  void restart() {
    emit(PhoneVerificationState(seconds: '60', code: '', verificationId: state.verificationId));
    runTimer();
  }

  void clearState() {
    _timer.cancel();
    emit(PhoneVerificationState(seconds: '00', code: '', verificationId: state.verificationId));
  }
}
