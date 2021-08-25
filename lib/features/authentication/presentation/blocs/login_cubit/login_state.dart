part of 'login_cubit.dart';

class LoginState extends Equatable {
  final EmailFormModel email;
  final PasswordFormModel password;
  final FormzStatus status;
  final String errorMessage;

  final bool obsecurePassword;
  final bool obsecurePasswordConfirm;

  const LoginState({
    this.email = const EmailFormModel.pure(),
    this.password = const PasswordFormModel.pure(),
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
    EmailFormModel? email,
    PasswordFormModel? password,
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
