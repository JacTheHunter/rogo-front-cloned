part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationSignInAnonimousRequested extends AuthenticationEvent {}

class AuthenticationSignInWithGoogleRequested extends AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  const AuthenticationUserChanged(this.user);

  final FirebaseUser user;

  @override
  List<Object> get props => [user];
}
