part of 'auth_bloc.dart';

class AuthState extends Equatable {
  String errorMessage;
  bool isObscure;
  bool isPasswordValid;
  bool checkBox;

  AuthState({
    this.errorMessage = '',
    this.isObscure = false,
    this.isPasswordValid = true,
    this.checkBox = true,
  });

  AuthState copyWith({
    String? errorMessage,
    bool? isObscure,
    bool? isPasswordValid,
    bool? checkBox,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      isObscure: isObscure ?? this.isObscure,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      checkBox: checkBox ?? this.checkBox,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        isObscure,
        isPasswordValid,
        checkBox,
      ];
}
