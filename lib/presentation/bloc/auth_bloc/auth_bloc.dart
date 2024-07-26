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
    on<ConfirmPasswordValid>(_confirmPasswordValid);
    on<SignInCheckBoxToggle>(_checkBoxToggle);
    on<SignIn>(_login);
    on<SignUp>(_signUp);
    on<SignInLoading>(_loading);
    on<SignUpLoading>(_signUpLoading);
    on<SignUpToggle>(_signUpToggle);
    on<ConfirmPasswordToggle>(_confirmPasswordToggle);
  }

  final AuthUseCase authUseCase;

  _loading(SignInLoading event, emit) {
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
  }

  _signUpLoading(SignUpLoading event, emit) {
    emit(
      state.copyWith(
        signUpStatus: SignUpStatus.loading,
      ),
    );
  }

  _login(SignIn event, emit) async {
    final response = await authUseCase.login(
      email: event.email,
      password: event.password,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: SignInStatus.home,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: SignInStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _signUp(SignUp event, emit) async {
    final response = await authUseCase.signUp(
      username: event.username,
      email: event.email,
      password: event.password,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            signUpStatus: SignUpStatus.loaded,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            signUpStatus: SignUpStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

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

  void _signUpToggle(SignUpToggle event, emit) {
    emit(
      state.copyWith(
        signUpObscure: !state.signUpObscure,
      ),
    );
  }

  void _confirmPasswordToggle(ConfirmPasswordToggle event, emit) {
    emit(
      state.copyWith(
        confirmPasswordObscure: !state.confirmPasswordObscure,
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

  void _confirmPasswordValid(ConfirmPasswordValid event, emit) {
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    RegExp numberRegex = RegExp(r'[0-9]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    emit(
      state.copyWith(
        confirmPasswordValid: specialCharRegex.hasMatch(event.password ?? '') &&
            numberRegex.hasMatch(event.password ?? '') &&
            lowercaseRegex.hasMatch(event.password ?? '') &&
            uppercaseRegex.hasMatch(event.password ?? ''),
      ),
    );
  }
}
