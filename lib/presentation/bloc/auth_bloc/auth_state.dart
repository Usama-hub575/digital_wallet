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
  bool confirmPasswordValid;

  AuthState({
    this.errorMessage = '',
    this.status = SignInStatus.init,
    this.confirmPasswordObscure = false,
    this.signUpStatus = SignUpStatus.init,
    this.isObscure = false,
    this.start = 120,
    this.isPasswordValid = true,
    this.checkBox = true,
    this.signUpObscure = false,
    this.confirmPasswordValid = false,
  });

  AuthState copyWith({
    String? errorMessage,
    bool? isObscure,
    bool? isPasswordValid,
    bool? checkBox,
    int? start,
    SignInStatus? status,
    SignUpStatus? signUpStatus,
    bool? confirmPasswordObscure,
    bool? signUpObscure,
    bool? confirmPasswordValid,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      isObscure: isObscure ?? this.isObscure,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      checkBox: checkBox ?? this.checkBox,
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
        isObscure,
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
