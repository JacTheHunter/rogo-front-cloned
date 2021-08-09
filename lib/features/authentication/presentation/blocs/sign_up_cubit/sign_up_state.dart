part of 'sign_up_cubit.dart';

class SingUpState extends Equatable {
  final Email email;
  final Password password;
  final PasswordConfirm passwordConfirm;
  final FormzStatus status;
  final AcceptPolicy acceptPolicy;
  final String errorMessage;

  final bool obsecurePassword;
  final bool obsecurePasswordConfirm;

  const SingUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.passwordConfirm = const PasswordConfirm.pure(),
    this.acceptPolicy = const AcceptPolicy.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.obsecurePassword = true,
    this.obsecurePasswordConfirm = true,
  });

  @override
  List<Object> get props => [
        email,
        password,
        passwordConfirm,
        acceptPolicy,
        status,
        errorMessage,
        obsecurePassword,
        obsecurePasswordConfirm,
      ];

  SingUpState copyWith({
    Email? email,
    Password? password,
    PasswordConfirm? passwordConfirm,
    AcceptPolicy? acceptPolicy,
    FormzStatus? status,
    String? errorMessage,
    bool? obsecurePassword,
    bool? obsecurePasswordConfirm,
  }) {
    return SingUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      acceptPolicy: acceptPolicy ?? this.acceptPolicy,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      obsecurePasswordConfirm: obsecurePasswordConfirm ?? this.obsecurePasswordConfirm,
    );
  }
}
