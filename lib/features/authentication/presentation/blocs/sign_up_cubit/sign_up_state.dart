part of 'sign_up_cubit.dart';

class SingUpState extends Equatable {
  final EmailFormModel email;
  final PasswordFormModel password;
  final PasswordConfirm passwordConfirm;
  final FormzStatus status;
  final AcceptPolicyFormModel acceptPolicy;
  final String errorMessage;

  final bool obsecurePassword;
  final bool obsecurePasswordConfirm;

  const SingUpState({
    this.email = const EmailFormModel.pure(),
    this.password = const PasswordFormModel.pure(),
    this.passwordConfirm = const PasswordConfirm.pure(),
    this.acceptPolicy = const AcceptPolicyFormModel.pure(),
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
    EmailFormModel? email,
    PasswordFormModel? password,
    PasswordConfirm? passwordConfirm,
    AcceptPolicyFormModel? acceptPolicy,
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
