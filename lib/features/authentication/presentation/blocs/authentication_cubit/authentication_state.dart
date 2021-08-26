part of 'authentication_cubit.dart';

enum AuthenticationStatus { registered, unregistered, loading }

class AuthenticationState extends Equatable {
  final User? currentUser;
  final AuthenticationStatus status;

  AuthenticationState._({
    this.currentUser,
    required this.status,
  });

  AuthenticationState.registered(User u) : this._(currentUser: u, status: AuthenticationStatus.registered);
  AuthenticationState.unregistered() : this._(status: AuthenticationStatus.unregistered);
  AuthenticationState.loading() : this._(status: AuthenticationStatus.loading);

  bool get authenticated => currentUser != null;

  @override
  List<Object?> get props => [
        currentUser,
        status,
      ];
}
