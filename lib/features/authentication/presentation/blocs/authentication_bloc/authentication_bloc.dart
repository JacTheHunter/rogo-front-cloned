import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';
import 'package:rogo/features/authentication/domain/usecases/get_user_stream_from_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_in_anonymous_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_in_with_google_in_firebase_usecase.dart';
import 'package:rogo/features/authentication/domain/usecases/sign_out_in_firebase_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required GetUserStreamInFirebaseUseCase getUserStreamInFirebaseUseCase,
    required SignOutInFirebaseUseCase signOutInFirebaseUseCase,
    required SignInAnonymousInFirebaseUseCase signInAnonymousInFirebaseUseCase,
    required SignInWithGoogleInFirebaseUseCase signInWithGoogleInFirebaseUseCase,
  })  : _signOutInFirebaseUseCase = signOutInFirebaseUseCase,
        _getUserStreamInFirebaseUseCase = getUserStreamInFirebaseUseCase,
        _signInAnonymousInFirebaseUseCase = signInAnonymousInFirebaseUseCase,
        _signInWithGoogleInFirebaseUseCase = signInWithGoogleInFirebaseUseCase,
        super(
          const AuthenticationState.unauthenticated(),
        ) {
    _userSubscription = _getUserStreamInFirebaseUseCase.call(NoParams()).listen(_onUserChanged);
  }

  final GetUserStreamInFirebaseUseCase _getUserStreamInFirebaseUseCase;

  final SignOutInFirebaseUseCase _signOutInFirebaseUseCase;

  final SignInAnonymousInFirebaseUseCase _signInAnonymousInFirebaseUseCase;

  final SignInWithGoogleInFirebaseUseCase _signInWithGoogleInFirebaseUseCase;

  late final StreamSubscription<FirebaseUser> _userSubscription;

  void _onUserChanged(FirebaseUser user) {
    add(AuthenticationUserChanged(user));
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is AuthenticationLogoutRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signOutInFirebaseUseCase.call(NoParams());
    } else if (event is AuthenticationSignInAnonimousRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signInAnonymousInFirebaseUseCase.call(NoParams());
    } else if (event is AuthenticationSignInWithGoogleRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signInWithGoogleInFirebaseUseCase.call(NoParams());
    }
  }

  AuthenticationState _mapUserChangedToState(AuthenticationUserChanged event, AuthenticationState state) {
    sl<NavigatorService>().pop();
    return event.user.uid.isNotEmpty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  // @override
  // AuthenticationState? fromJson(Map<String, dynamic> json) {
  //   if (json['authenticationStatus'] == 0) {
  //     AuthenticationState.unauthenticated();
  //   } else {
  //     return AuthenticationState.authenticated(FirebaseUserModel.fromJson(json));
  //   }
  // }

  // @override
  // Map<String, dynamic>? toJson(AuthenticationState state) {
  //   final Map<String, dynamic> map = {'authenticationStatus': state.status.index};
  //   if (state.user != null) {
  //     map.addAll(FirebaseUserModel(isAnonymous: state.user!.isAnonymous, uid: state.user!.uid, email: state.user?.email)
  //         .toJson());
  //   }
  //   return map;
  // }
}
