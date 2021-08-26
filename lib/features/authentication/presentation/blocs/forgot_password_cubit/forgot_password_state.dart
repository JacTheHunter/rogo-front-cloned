part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final EmailFormModel email;
  final FormzStatus status;
  final String errorMessage;

  const ForgotPasswordState({
    this.email = const EmailFormModel.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [
        email,
        status,
        errorMessage,
      ];

  ForgotPasswordState copyWith({
    EmailFormModel? email,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
