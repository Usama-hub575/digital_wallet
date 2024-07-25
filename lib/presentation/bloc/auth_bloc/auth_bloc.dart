import 'package:digital_wallet/export.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authUseCase,
  }) : super(
          AuthState(),
        ) {
    on<SignInToggle>(_toggle);
    on<IsPasswordValid>(_isPasswordValid);
    on<SignInCheckBoxToggle>(_checkBoxToggle);
  }

  final AuthUseCase authUseCase;

  void _checkBoxToggle(SignInCheckBoxToggle event, emit) {
    emit(
      state.copyWith(
        checkBox: !state.checkBox,
      ),
    );
  }

  void _toggle(SignInToggle event, emit) {
    emit(
      state.copyWith(
        isObscure: !state.isObscure,
      ),
    );
  }

  void _isPasswordValid(IsPasswordValid event, emit) {
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    RegExp numberRegex = RegExp(r'[0-9]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    emit(
      state.copyWith(
        isPasswordValid: specialCharRegex.hasMatch(event.password ?? '') &&
            numberRegex.hasMatch(event.password ?? '') &&
            lowercaseRegex.hasMatch(event.password ?? '') &&
            uppercaseRegex.hasMatch(event.password ?? ''),
      ),
    );
  }
}
