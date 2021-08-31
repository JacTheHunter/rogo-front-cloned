part of 'authentication_cubit.dart';

enum AuthenticationStatus { guest, registered, unregistered, loading }

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
  AuthenticationState.guest() : this._(status: AuthenticationStatus.guest);

  bool get authenticated => status == AuthenticationStatus.guest || status == AuthenticationStatus.registered;

  @override
  List<Object?> get props => [
        currentUser,
        status,
      ];
}
