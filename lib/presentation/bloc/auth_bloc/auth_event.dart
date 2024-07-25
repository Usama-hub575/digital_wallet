part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInToggle extends AuthEvent {}

class IsPasswordValid extends AuthEvent {
  final String? password;

  IsPasswordValid({
    required this.password,
  });
}

class SignInCheckBoxToggle extends AuthEvent {}
