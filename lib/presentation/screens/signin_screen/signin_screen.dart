import 'package:digital_wallet/export.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SIGN IN",
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
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpacer(20),
                  Center(
                    child: Text(
                      "Glad to meet you",
                      style: textStyles.bold.copyWith(
                        fontSize: 27.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "again!",
                      textAlign: TextAlign.center,
                      style: textStyles.bold.copyWith(
                        fontSize: 27.sp,
                      ),
                    ),
                  ),
                  verticalSpacer(30),
                  GenericTextField(
                    hintText: "Name",
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
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    return GenericTextField(
                      obscureText: state.isObscure,
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
                        if (value!.isEmpty) {
                          return AppConstants.pleaseEnterYourPassword;
                        }
                        return null;
                      },
                      hintText: "Password",
                      controller: passwordController,
                    );
                  }),
                  Row(
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                        return Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            activeColor: ColorName.primaryColorLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: const BorderSide(
                              style: BorderStyle.solid,
                            ),
                            value: state.checkBox,
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                    SignInCheckBoxToggle(),
                                  );
                            },
                          ),
                        );
                      }),
                      Text(
                        "Remember me",
                        style: textStyles.light.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Forgot Password",
                        style: textStyles.light.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpacer(30),
                    ],
                  ),
                  verticalSpacer(50),
                  SmallButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.dashboardScreen,
                      );
                      // if (loginFormKey.currentState!.validate()) {
                      //   FocusScope.of(context).requestFocus(
                      //     FocusNode(),
                      //   );
                      // }
                    },
                    buttonColor: ColorName.primaryColorLight,
                    buttonText: "Sign In",
                  ),
                  verticalSpacer(20),
                  const SmallButtonWidget(
                    buttonColor: ColorName.primaryColor,
                    buttonText: "Sign Up",
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
                          Navigator.pushNamed(
                            context,
                            AppRoutes.signupScreen,
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: textStyles.semiBold.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
