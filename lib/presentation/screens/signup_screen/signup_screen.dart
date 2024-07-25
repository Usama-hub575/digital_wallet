import 'package:digital_wallet/export.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          centerTitle: true,
          title: Text(
            "SIGN Up",
            style: textStyles.light.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15.54.sp,
              color: ColorName.lightGreyText,
            ),
          ),
        ),
        backgroundColor: ColorName.pureWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            child: Form(
              key: signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpacer(20),
                  Center(
                    child: Text(
                      "Welcome To",
                      style: textStyles.bold.copyWith(
                        fontSize: 27.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Name Start Now",
                      textAlign: TextAlign.center,
                      style: textStyles.bold.copyWith(
                        fontSize: 27.sp,
                      ),
                    ),
                  ),
                  verticalSpacer(30),
                  GenericTextField(
                    hintText: "Name",
                    controller: nameController,
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppConstants.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  verticalSpacer(20),
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return GenericTextField(
                        obscureText: state.isObscure,
                        hintText: "Password",
                        controller: passwordController,
                        readOnly: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignInToggle(),
                                );
                          },
                          icon: state.isObscure
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
                      );
                    },
                  ),
                  verticalSpacer(20),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return GenericTextField(
                        obscureText: state.isObscure,
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        readOnly: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignInToggle(),
                                );
                          },
                          icon: state.isObscure
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
                            return AppConstants.confirmPassword;
                          } else if (value.length < 6) {
                            return AppConstants
                                .passwordLengthShouldBeMoreThanSixCharacters;
                          } else if (!state.isPasswordValid) {
                            return AppConstants
                                .passwordMustContainAtLeastOneSpecialCharacterOneNumberAndBothLowercaseAndUppercaseLetters;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  verticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Terms of use",
                        style: textStyles.semiBold.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "  Or  ",
                        style: textStyles.light.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Privacy notice",
                        style: textStyles.semiBold.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacer(50),
                  SmallButtonWidget(
                    buttonColor: ColorName.primaryColorLight,
                    buttonText: "Sign Up Now",
                    onTap: () {
                      if (signUpFormKey.currentState!.validate()) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
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
          ),
        ),
      ),
    );
  }
}
