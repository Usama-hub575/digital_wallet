import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/widgets/long_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController signInController = TextEditingController();

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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 5.h,
          ),
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
                controller: signInController,
              ),
              verticalSpacer(20),
              GenericTextField(
                hintText: "Password",
                controller: signInController,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: const BorderSide(
                        style: BorderStyle.solid,
                      ),
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
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
              const SmallButtonWidget(
                buttonColor: ColorName.primaryColorLight,
                buttonText: "Sign In",
              ),
              verticalSpacer(20),
              const SmallButtonWidget(
                buttonColor: ColorName.primaryColor,
                buttonText: "Sign Up",
              ),
              const Spacer(),
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
                  Text(
                    "Sign Up",
                    style: textStyles.semiBold.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
