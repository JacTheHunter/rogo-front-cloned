part of 'phone_verification_cubit.dart';

class PhoneVerificationState extends Equatable {
  final String code;
  final String seconds;
  final String verificationId;
  final String errorMessage;
  final bool loading;
  const PhoneVerificationState({
    required this.code,
    required this.seconds,
    required this.verificationId,
    this.errorMessage = '',
    this.loading = false,
  });

  PhoneVerificationState copyWith({
    String? code,
    String? seconds,
    String? verificationId,
    String? errorMessage,
    bool? loading,
  }) {
    return PhoneVerificationState(
      code: code ?? this.code,
      seconds: seconds ?? this.seconds,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? '',
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [
        code,
        seconds,
        verificationId,
        errorMessage,
        loading,
      ];
}
