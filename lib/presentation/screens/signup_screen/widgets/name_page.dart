import 'package:digital_wallet/export.dart';

class NamePage extends StatelessWidget {
  NamePage({
    required this.onTap,
    super.key,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: signUpFormKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(10),
                  Text(
                    "Lastly, tell us more about yourself",
                    style: textStyles.bold.copyWith(
                      fontSize: 28.sp,
                    ),
                  ),
                  verticalSpacer(20),
                  Text(
                    "Please enter your legal name. This information will be used to verify your account.",
                    style: textStyles.regular.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  verticalSpacer(20),
                  Text(
                    "First Name",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  GenericTextField(
                    hintText: "First Name",
                    controller: firstNameController,
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppConstants.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  verticalSpacer(20),
                  Text(
                    "Last Name",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  GenericTextField(
                    hintText: "First Name",
                    controller: lastNameController,
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppConstants.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  verticalSpacer(10),
                  Text(
                    "Email",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  GenericTextField(
                    hintText: "Email",
                    controller: emailController,
                    readOnly: true,
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
                  verticalSpacer(20),
                  Text(
                    "Password",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  GenericTextField(
                    obscureText: state.signUpObscure,
                    hintText: "Password",
                    controller: passwordController,
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignUpToggle(),
                            );
                      },
                      icon: state.signUpObscure
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(
                              Icons.visibility_off,
                            ),
                    ),
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
                  ),
                  verticalSpacer(20),
                  Text(
                    "Confirm Password",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  GenericTextField(
                    obscureText: state.confirmPasswordObscure,
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              ConfirmPasswordToggle(),
                            );
                      },
                      icon: state.confirmPasswordObscure
                          ? const Icon(
                              Icons.visibility,
                            )
                          : const Icon(
                              Icons.visibility_off,
                            ),
                    ),
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
                        return AppConstants.passwordDoesNotMatch;
                      }
                      return null;
                    },
                  ),
                  verticalSpacer(50),
                  BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return GenericButton(
                        isLoading: state.signUpStatus == SignUpStatus.loading
                            ? true
                            : false,
                        buttonColor: ColorName.primaryColorLight,
                        buttonText: "Continue",
                        onTap: () {
                          // if (signUpFormKey.currentState!.validate()) {
                          //   FocusScope.of(context).requestFocus(
                          //     FocusNode(),
                          //   );
                          //   context.read<AuthBloc>().add(
                          //         SignUpLoading(),
                          //       );
                          //   context.read<AuthBloc>().add(
                          //         SignUp(
                          //           email: emailController.text,
                          //           username: nameController.text,
                          //           password: passwordController.text,
                          //         ),
                          //       );
                          // }
                          context.read<AuthBloc>().add(
                                ChangeSignupIndex(signupIndex: 1),
                              );
                          onTap();
                          // Navigator.pushNamed(
                          //   context,
                          //   AppRoutes.verificationScreen,
                          //   arguments: {
                          //     "Email": emailController.text,
                          //   },
                          // );
                        },
                      );
                    },
                    listener: (context, state) {
                      switch (state.signUpStatus) {
                        case SignUpStatus.init:
                          // TODO: Handle this case.
                          break;
                        case SignUpStatus.loading:
                          // TODO: Handle this case.
                          break;
                        case SignUpStatus.loaded:
                          // TODO: Handle this case.
                          break;
                        case SignUpStatus.error:
                          showErrorToast(
                            message: state.errorMessage,
                            context: context,
                          );
                          state.signUpStatus = SignUpStatus.init;
                          break;
                        case SignUpStatus.success:
                          Navigator.pushNamed(
                            context,
                            AppRoutes.verificationScreen,
                            arguments: {
                              "Email": emailController.text,
                            },
                          );
                          state.signUpStatus = SignUpStatus.init;
                          break;
                      }
                    },
                  ),
                  verticalSpacer(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already Registered? ",
                        style: textStyles.light.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: textStyles.semiBold.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
