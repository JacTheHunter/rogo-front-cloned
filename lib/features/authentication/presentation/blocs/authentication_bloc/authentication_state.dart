part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unauthenticated,
  authenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final FirebaseUser user;

  const AuthenticationState._({
    required this.status,
    this.user = const FirebaseUser(uid: '', isAnonymous: false),
  });

  const AuthenticationState.authenticated(FirebaseUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
