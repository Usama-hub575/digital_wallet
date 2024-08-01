import 'package:digital_wallet/export.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  TextEditingController forgetPasswordController = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

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
          key: forgotPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(50),
              Text(
                "Forgot Password?",
                style: textStyles.bold.copyWith(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(20),
              Text(
                "No worries! Enter your email address below \n and we will send you a code to reset password.",
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
                  "Email",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                controller: forgetPasswordController,
                hintText: "Enter your email",
                validator: (value) {
                  bool emailValid = RegExp(
                    AppConstants.emailRegExp,
                  ).hasMatch(value!);
                  if (value.isEmpty) {
                    return AppConstants.pleaseEnterYourEmail;
                  } else if (!emailValid) {
                    return AppConstants.pleaseEnterValidEmailAddress;
                  }
                  return null;
                },
              ),
              const Spacer(),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  return GenericButton(
                    onTap: () {
                      if (forgotPasswordFormKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              ForgetPasswordLoading(),
                            );
                        context.read<AuthBloc>().add(
                              ForgetPassword(
                                email: forgetPasswordController.text,
                              ),
                            );
                      }
                      ;
                    },
                    isLoading: state.forgotPasswordStatus ==
                            ForgotPasswordStatus.loading
                        ? true
                        : false,
                    buttonText: "Send Reset Code",
                    buttonColor: ColorName.primaryColorLight,
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  switch (state.forgotPasswordStatus) {
                    case ForgotPasswordStatus.success:
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verifyAccountScreen,
                      );
                      state.forgotPasswordStatus = ForgotPasswordStatus.init;
                      break;
                    case ForgotPasswordStatus.init:
                      break;
                    // TODO: Handle this case.
                    case ForgotPasswordStatus.loading:
                      break;
                    // TODO: Handle this case.
                    case ForgotPasswordStatus.loaded:
                      break;
                    // TODO: Handle this case.
                    case ForgotPasswordStatus.error:
                      showErrorToast(
                        message: state.errorMessage,
                        context: context,
                      );
                      state.forgotPasswordStatus = ForgotPasswordStatus.init;
                      break;
                    // TODO: Handle this case.
                    case ForgotPasswordStatus.passwordSuccessfullyReset:
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
