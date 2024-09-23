part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInToggle extends AuthEvent {}

class SignUpToggle extends AuthEvent {}

class ConfirmPasswordToggle extends AuthEvent {}

class ChangeCurrentIndex extends AuthEvent {
  final int currentIndex;

  ChangeCurrentIndex({
    required this.currentIndex,
  });
}

class IsPasswordValid extends AuthEvent {
  final String? password;

  IsPasswordValid({
    required this.password,
  });
}

class ConfirmPasswordValid extends AuthEvent {
  final String? password;

  ConfirmPasswordValid({
    required this.password,
  });
}

class SignInLoading extends AuthEvent {}

class SignUpLoading extends AuthEvent {}

class SignInCheckBoxToggle extends AuthEvent {}

class ResetPassword extends AuthEvent {
  final String otp;
  final String newPassword;

  ResetPassword({
    required this.otp,
    required this.newPassword,
  });
}

class ForgetPasswordLoading extends AuthEvent {}

class ForgetPassword extends AuthEvent {
  final String email;

  ForgetPassword({
    required this.email,
  });
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn({
    required this.email,
    required this.password,
  });
}

class SignUp extends AuthEvent {
  final String email;
  final String username;
  final String password;

  SignUp({
    required this.email,
    required this.username,
    required this.password,
  });
}

class StartTimer extends AuthEvent {}

class VerifyOTPLoading extends AuthEvent {}

class VerifyOTP extends AuthEvent {
  final String email;
  final String otp;

  VerifyOTP({
    required this.email,
    required this.otp,
  });
}
