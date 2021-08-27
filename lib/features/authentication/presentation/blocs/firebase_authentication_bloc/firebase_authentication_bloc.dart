import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/services/box_service.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/firebase_user.dart';
import '../../../domain/usecases/get_jwt_of_firebase_user_usecase.dart';
import '../../../domain/usecases/get_user_stream_from_firebase_usecase.dart';
import '../../../domain/usecases/sign_in_anonymous_firebase_usecase.dart';
import '../../../domain/usecases/sign_in_with_google_in_firebase_usecase.dart';
import '../../../domain/usecases/sign_out_in_firebase_usecase.dart';

part 'firebase_authentication_event.dart';
part 'firebase_authentication_state.dart';

class FirebaseAuthenticationBloc extends Bloc<FirebaseAuthenticationEvent, FirebaseAuthenticationState> {
  FirebaseAuthenticationBloc({
    required GetUserStreamInFirebaseUseCase getUserStreamInFirebaseUseCase,
    required SignOutInFirebaseUseCase signOutInFirebaseUseCase,
    required SignInAnonymousInFirebaseUseCase signInAnonymousInFirebaseUseCase,
    required SignInWithGoogleInFirebaseUseCase signInWithGoogleInFirebaseUseCase,
    required GetJWTofFirebseUserUseCase getJWTofFirebseUserUseCase,
  })  : _signOutInFirebaseUseCase = signOutInFirebaseUseCase,
        _getUserStreamInFirebaseUseCase = getUserStreamInFirebaseUseCase,
        _signInAnonymousInFirebaseUseCase = signInAnonymousInFirebaseUseCase,
        _signInWithGoogleInFirebaseUseCase = signInWithGoogleInFirebaseUseCase,
        _getJWTofFirebseUserUseCase = getJWTofFirebseUserUseCase,
        super(
          const FirebaseAuthenticationState.unauthenticated(),
        ) {
    _userSubscription = _getUserStreamInFirebaseUseCase.call(NoParams()).listen(_onUserChanged);
  }

  final GetUserStreamInFirebaseUseCase _getUserStreamInFirebaseUseCase;

  final SignOutInFirebaseUseCase _signOutInFirebaseUseCase;

  final SignInAnonymousInFirebaseUseCase _signInAnonymousInFirebaseUseCase;

  final SignInWithGoogleInFirebaseUseCase _signInWithGoogleInFirebaseUseCase;

  final GetJWTofFirebseUserUseCase _getJWTofFirebseUserUseCase;

  late final StreamSubscription<FirebaseUser> _userSubscription;

  void _onUserChanged(FirebaseUser user) {
    add(FirebaseAuthenticationUserChanged(user));
  }

  @override
  Stream<FirebaseAuthenticationState> mapEventToState(FirebaseAuthenticationEvent event) async* {
    if (event is FirebaseAuthenticationUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is FirebaseAuthenticationLogoutRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signOutInFirebaseUseCase.call(NoParams());
    } else if (event is FirebaseAuthenticationSignInAnonimousRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signInAnonymousInFirebaseUseCase.call(NoParams());
    } else if (event is FirebaseAuthenticationSignInWithGoogleRequested) {
      // unawaited(_signOutInFirebaseUseCase.call(NoParams()));
      _signInWithGoogleInFirebaseUseCase.call(NoParams());
    } else if (event is FirebaseAuthenticationGetJWTofFirebaseUserRequested) {
      getAndStoreJwt();
    }
  }

  FirebaseAuthenticationState _mapUserChangedToState(
      FirebaseAuthenticationUserChanged event, FirebaseAuthenticationState state) {
    sl<NavigatorService>().pop();

    if (event.user.uid.isNotEmpty) {
      getAndStoreJwt();
      return FirebaseAuthenticationState.authenticated(event.user);
    } else {
      return const FirebaseAuthenticationState.unauthenticated();
    }
  }

  void getAndStoreJwt() async {
    final result = await _getJWTofFirebseUserUseCase.call(NoParams());
    result.fold((l) {}, (r) {
      if (r.isNotEmpty) sl<BoxService>().appSettings.put('jwt', r);
    });
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
