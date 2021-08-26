part of 'firebase_authentication_bloc.dart';

enum FirebaseAuthenticationStatus {
  unauthenticated,
  authenticated,
}

class FirebaseAuthenticationState extends Equatable {
  final FirebaseAuthenticationStatus status;
  final FirebaseUser user;

  const FirebaseAuthenticationState._({
    required this.status,
    this.user = const FirebaseUser(uid: '', isAnonymous: false),
  });

  const FirebaseAuthenticationState.authenticated(FirebaseUser user)
      : this._(status: FirebaseAuthenticationStatus.authenticated, user: user);

  const FirebaseAuthenticationState.unauthenticated() : this._(status: FirebaseAuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
