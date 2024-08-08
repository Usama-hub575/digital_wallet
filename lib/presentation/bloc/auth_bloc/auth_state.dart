part of 'auth_bloc.dart';

class AuthState extends Equatable {
  String errorMessage;
  bool isObscure;
  bool confirmPasswordObscure;
  bool signUpObscure;
  bool isPasswordValid;
  int start;
  bool checkBox;
  SignInStatus status;
  SignUpStatus signUpStatus;
  ForgotPasswordStatus forgotPasswordStatus;
  bool confirmPasswordValid;
  VerifyOtpStatus verifyOtpStatus;

  AuthState({
    this.errorMessage = '',
    this.status = SignInStatus.init,
    this.confirmPasswordObscure = false,
    this.signUpStatus = SignUpStatus.init,
    this.isObscure = true,
    this.start = 120,
    this.isPasswordValid = true,
    this.forgotPasswordStatus = ForgotPasswordStatus.init,
    this.checkBox = true,
    this.signUpObscure = true,
    this.confirmPasswordValid = false,
    this.verifyOtpStatus = VerifyOtpStatus.init,
  });

  AuthState copyWith({
    String? errorMessage,
    bool? isObscure,
    bool? isPasswordValid,
    bool? checkBox,
    int? start,
    SignInStatus? status,
    ForgotPasswordStatus? forgotPasswordStatus,
    SignUpStatus? signUpStatus,
    bool? confirmPasswordObscure,
    bool? signUpObscure,
    bool? confirmPasswordValid,
    VerifyOtpStatus? verifyOtpStatus,
  }) {
    return AuthState(
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isObscure: isObscure ?? this.isObscure,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      checkBox: checkBox ?? this.checkBox,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      status: status ?? this.status,
      confirmPasswordValid: confirmPasswordValid ?? this.confirmPasswordValid,
      confirmPasswordObscure:
          confirmPasswordObscure ?? this.confirmPasswordObscure,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      signUpObscure: signUpObscure ?? this.signUpObscure,
      start: start ?? this.start,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        forgotPasswordStatus,
        isObscure,
        verifyOtpStatus,
        isPasswordValid,
        checkBox,
        start,
        status,
        signUpStatus,
        confirmPasswordObscure,
        signUpObscure,
        confirmPasswordValid,
      ];
}
