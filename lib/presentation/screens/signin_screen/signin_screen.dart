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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(20),
                  Text(
                    "Welcome !",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 26.sp,
                    ),
                  ),
                  Text(
                    "Welcome to Wallet App!",
                    textAlign: TextAlign.center,
                    style: textStyles.regular.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpacer(30),
                  Text(
                    "Name",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
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
                  Text(
                    "Email",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpacer(10),
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
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.forgetPasswordScreen,
                        ),
                        child: Text(
                          "Forgot Password",
                          style: textStyles.light.copyWith(
                            fontSize: 11.sp,
                            color: ColorName.primaryColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      verticalSpacer(30),
                    ],
                  ),
                  verticalSpacer(30),
                  BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return GenericButton(
                        isLoading:
                            state.status == SignInStatus.loading ? true : false,
                        onTap: () {
                          // if (loginFormKey.currentState!.validate()) {
                          //   FocusScope.of(context).requestFocus(
                          //     FocusNode(),
                          //   );
                          //   context.read<AuthBloc>().add(
                          //         SignInLoading(),
                          //       );
                          //   context.read<AuthBloc>().add(
                          //         SignIn(
                          //           email: emailController.text,
                          //           password: passwordController.text,
                          //         ),
                          //       );
                          // }
                          Navigator.pushNamed(
                            context,
                            AppRoutes.hostPage,
                          );
                        },
                        buttonColor: ColorName.primaryColorLight,
                        buttonText: "Sign In",
                      );
                    },
                    listener: (context, state) {
                      switch (state.status) {
                        case SignInStatus.init:
                          // TODO: Handle this case.
                          break;
                        case SignInStatus.loading:
                          // TODO: Handle this case.
                          break;
                        case SignInStatus.home:
                          Navigator.pushNamed(
                            context,
                            AppRoutes.hostPage,
                          );
                          context.read<HostBloc>().add(
                                CurrentIndex(currentIndex: 0),
                              );
                          state.status = SignInStatus.init;
                          break;
                        case SignInStatus.loaded:
                          // TODO: Handle this case.
                          break;
                        case SignInStatus.error:
                          showErrorToast(
                            message: state.errorMessage,
                            context: context,
                          );
                          state.status = SignInStatus.init;
                          break;
                        case SignInStatus.success:
                          state.status = SignInStatus.init;
                          break;
                      }
                    },
                  ),
                  verticalSpacer(20),
                  SizedBox(
                    width: double.infinity,
                    child: MerchantGenericOutlinedButton(
                      title: "Register",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.signupScreen,
                        );
                      },
                    ),
                  ),
                  verticalSpacer(30),
                  Center(
                    child: Text(
                      "Login with touch ID",
                      style: textStyles.regular.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  verticalSpacer(20),
                  Center(
                    child: SvgPicture.asset(
                      Assets.svg.touchId,
                    ),
                  ),
                  verticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorName.grey.withOpacity(0.3),
                          thickness: 2,
                        ),
                      ),
                      horizontalSpacer(10),
                      Text(
                        "or connect with",
                        style: textStyles.regular.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      horizontalSpacer(10),
                      Expanded(
                        child: Divider(
                          color: ColorName.grey.withOpacity(0.3),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.facebook,
                      ),
                      SvgPicture.asset(
                        Assets.svg.instagram,
                      ),
                      SvgPicture.asset(
                        Assets.svg.pinterest,
                      ),
                      SvgPicture.asset(
                        Assets.svg.linkedin,
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
