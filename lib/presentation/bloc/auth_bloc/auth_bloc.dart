import 'dart:async';
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
    on<ChangeCurrentIndex>(_changeCurrentIndex);
    on<SignInLoading>(_loading);
    on<SignUpLoading>(_signUpLoading);
    on<SignUpToggle>(_signUpToggle);
    on<ConfirmPasswordToggle>(_confirmPasswordToggle);
    on<StartTimer>(_startTimer);
    on<VerifyOTP>(_verifyOTP);
    on<VerifyOTPLoading>(_verifyOtpLoading);
    on<ForgetPassword>(_forgetPassword);
    on<ForgetPasswordLoading>(_forgetPasswordLoading);
    on<ResetPassword>(_resetPassword);
    on<ChangeSignupIndex>(_changeSignupIndex);
  }

  final AuthUseCase authUseCase;

  _loading(SignInLoading event, emit) {
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
  }

  _forgetPasswordLoading(ForgetPasswordLoading event, emit) {
    emit(
      state.copyWith(
        forgotPasswordStatus: ForgotPasswordStatus.loading,
      ),
    );
  }

  _changeCurrentIndex(ChangeCurrentIndex event, emit) {
    emit(
      state.copyWith(
        currentIndex: event.currentIndex,
      ),
    );
  }

  _changeSignupIndex(ChangeSignupIndex event, emit) {
    emit(
      state.copyWith(
        signupIndex: event.signupIndex,
      ),
    );
  }

  _verifyOtpLoading(VerifyOTPLoading event, emit) {
    emit(
      state.copyWith(
        verifyOtpStatus: VerifyOtpStatus.loading,
      ),
    );
  }

  _startTimer(StartTimer event, Emitter<AuthState> emit) {
    Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (Timer timer) {
        if (state.start < 2) {
          emit(
            state.copyWith(),
          );
          timer.cancel();
        } else {
          emit(
            state.copyWith(
              start: state.start--,
            ),
          );
        }
      },
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

  _resetPassword(ResetPassword event, emit) async {
    final response = await authUseCase.resetPassword(
      otp: event.otp,
      newPassword: event.newPassword,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            forgotPasswordStatus:
                ForgotPasswordStatus.passwordSuccessfullyReset,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            forgotPasswordStatus: ForgotPasswordStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _forgetPassword(ForgetPassword event, emit) async {
    final response = await authUseCase.forgetPassword(
      email: event.email,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            forgotPasswordStatus: ForgotPasswordStatus.success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            forgotPasswordStatus: ForgotPasswordStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _verifyOTP(VerifyOTP event, emit) async {
    final response = await authUseCase.verifyOTP(
      email: event.email,
      otp: event.otp,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            verifyOtpStatus: VerifyOtpStatus.success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            verifyOtpStatus: VerifyOtpStatus.loaded,
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
            signUpStatus: SignUpStatus.success,
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
