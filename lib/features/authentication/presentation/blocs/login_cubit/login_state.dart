part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final String errorMessage;

  final bool obsecurePassword;
  final bool obsecurePasswordConfirm;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.obsecurePassword = true,
    this.obsecurePasswordConfirm = true,
  });

  @override
  List<Object> get props => [
        email,
        password,
        status,
        errorMessage,
        obsecurePassword,
        obsecurePasswordConfirm,
      ];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
    bool? obsecurePassword,
    bool? obsecurePasswordConfirm,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      obsecurePasswordConfirm: obsecurePasswordConfirm ?? this.obsecurePasswordConfirm,
    );
  }
}
