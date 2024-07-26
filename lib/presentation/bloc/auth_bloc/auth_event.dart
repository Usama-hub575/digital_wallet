part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInToggle extends AuthEvent {}

class SignUpToggle extends AuthEvent {}

class ConfirmPasswordToggle extends AuthEvent {}

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
