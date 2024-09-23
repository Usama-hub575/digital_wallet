part of 'auth_bloc.dart';

class AuthState extends Equatable {
  String errorMessage;
  bool isObscure;
  bool confirmPasswordObscure;
  bool signUpObscure;
  bool isPasswordValid;
  int start;
  bool checkBox;
  int currentIndex;
  SignInStatus status;
  SignUpStatus signUpStatus;
  ForgotPasswordStatus forgotPasswordStatus;
  bool confirmPasswordValid;
  VerifyOtpStatus verifyOtpStatus;
  List<Map> onboardingContent;

  AuthState({
    this.errorMessage = '',
    this.status = SignInStatus.init,
    this.confirmPasswordObscure = false,
    this.currentIndex = 0,
    this.signUpStatus = SignUpStatus.init,
    this.isObscure = true,
    this.start = 120,
    this.isPasswordValid = true,
    this.onboardingContent = const [
      {
        "title": AppConstants.sendMoney,
        "description": AppConstants.sendMoneyEasilyAndWithOneClick,
      },
      {
        "title": AppConstants.requestMoney,
        "description": AppConstants.youCanRequestMoneyToFriends,
      },
      {
        "title": AppConstants.easyToUse,
        "description": AppConstants.veryEasyToUse,
      }
    ],
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
    int? currentIndex,
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
      currentIndex: currentIndex ?? this.currentIndex,
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
        currentIndex,
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
