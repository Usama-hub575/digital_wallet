import 'package:digital_wallet/export.dart';

class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({super.key});

  OtpFieldController otpFieldController = OtpFieldController();

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
          horizontal: 20.w,
          vertical: 15.h,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verify Account",
                style: textStyles.bold.copyWith(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(20),
              SvgPicture.asset(
                Assets.svg.verfiyAccount,
              ),
              verticalSpacer(20),
              Text(
                "Code has be sent to hamxa123@gmail.com. \n Enter the code to verify your account",
                textAlign: TextAlign.center,
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Code",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpacer(10),
              OTPTextField(
                controller: otpFieldController,
                width: double.infinity,
                length: 6,
                onCompleted: (otp) {
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(
                    context,
                    AppRoutes.createNewPasswordScreen,
                    arguments: {
                      "otp": otp,
                    },
                  );
                },
              ),
              verticalSpacer(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't Recieved code? ",
                    style: textStyles.semiBold.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Send Code",
                    style: textStyles.semiBold.copyWith(
                      decoration: TextDecoration.underline,
                      color: ColorName.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              verticalSpacer(10),
              Text(
                "Resend Code in 00:50 ",
                style: textStyles.semiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacer(30),
              GenericButton(
                buttonText: "Verify Account",
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.createNewPasswordScreen,
                  arguments: {
                    "otp": "123",
                  },
                ),
                buttonColor: ColorName.primaryColorLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
