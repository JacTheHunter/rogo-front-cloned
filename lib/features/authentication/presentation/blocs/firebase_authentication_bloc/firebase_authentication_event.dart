part of 'firebase_authentication_bloc.dart';

abstract class FirebaseAuthenticationEvent extends Equatable {
  const FirebaseAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class FirebaseAuthenticationLogoutRequested extends FirebaseAuthenticationEvent {}

class FirebaseAuthenticationSignInAnonimousRequested extends FirebaseAuthenticationEvent {}

class FirebaseAuthenticationSignInWithGoogleRequested extends FirebaseAuthenticationEvent {}

class FirebaseAuthenticationGetJWTofFirebaseUserRequested extends FirebaseAuthenticationEvent {}

class FirebaseAuthenticationUserChanged extends FirebaseAuthenticationEvent {
  const FirebaseAuthenticationUserChanged(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => [user];
}
