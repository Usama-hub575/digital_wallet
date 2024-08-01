import 'package:digital_wallet/export.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({
    required this.otp,
    super.key,
  });

  final String otp;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> createPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        backgroundColor: ColorName.pureWhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Form(
          key: createPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(50),
              Text(
                "create New Password",
                style: textStyles.bold.copyWith(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(20),
              Text(
                "Please enter and confirm your new password. \n You will need to login after you reset.",
                textAlign: TextAlign.center,
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(70),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpacer(10),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return GenericTextField(
                  controller: passwordController,
                  hintText: "Enter password",
                  validator: (value) {
                    context.read<AuthBloc>().add(
                          IsPasswordValid(
                            password: value,
                          ),
                        );
                    if (value!.isEmpty) {
                      return AppConstants.pleaseEnterYourPassword;
                    } else if (value.length < 6) {
                      return AppConstants
                          .passwordLengthShouldBeMoreThanSixCharacters;
                    } else if (!state.isPasswordValid) {
                      return AppConstants
                          .passwordMustContainAtLeastOneSpecialCharacterOneNumberAndBothLowercaseAndUppercaseLetters;
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                    ),
                  ),
                );
              }),
              verticalSpacer(30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpacer(10),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return GenericTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm password",
                    validator: (value) {
                      context.read<AuthBloc>().add(
                            ConfirmPasswordValid(
                              password: value,
                            ),
                          );
                      if (value!.isEmpty) {
                        return AppConstants.confirmPassword;
                      } else if (value.length < 6) {
                        return AppConstants
                            .passwordLengthShouldBeMoreThanSixCharacters;
                      } else if (!state.confirmPasswordValid) {
                        return AppConstants
                            .passwordMustContainAtLeastOneSpecialCharacterOneNumberAndBothLowercaseAndUppercaseLetters;
                      } else if (value != passwordController.text) {
                        return AppConstants.passwordDonotMatch;
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  return GenericButton(
                    onTap: () {
                      if (createPasswordFormKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              ForgetPasswordLoading(),
                            );
                        context.read<AuthBloc>().add(
                              ResetPassword(
                                otp: otp,
                                newPassword: passwordController.text,
                              ),
                            );
                      }
                      ;
                    },
                    isLoading: state.forgotPasswordStatus ==
                            ForgotPasswordStatus.loading
                        ? true
                        : false,
                    buttonText: "Reset Password",
                    buttonColor: ColorName.primaryColorLight,
                  );
                },
                listener: (BuildContext context, state) {
                  switch (state.forgotPasswordStatus) {
                    case ForgotPasswordStatus.init:
                      break;
                    case ForgotPasswordStatus.loading:
                      break;
                    case ForgotPasswordStatus.loaded:
                      break;
                    case ForgotPasswordStatus.success:
                      break;
                    case ForgotPasswordStatus.passwordSuccessfullyReset:
                      passwordResetDialog(context);
                      break;
                    case ForgotPasswordStatus.error:
                      showErrorToast(
                        message: state.errorMessage,
                        context: context,
                      );
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
