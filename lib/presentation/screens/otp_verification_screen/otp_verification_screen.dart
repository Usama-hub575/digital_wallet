import 'package:digital_wallet/export.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    required this.email,
    this.dashboardRoute = false,
    super.key,
  });

  final String email;
  final bool? dashboardRoute;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  OtpFieldController otpFieldController = OtpFieldController();

  @override
  void initState() {
    // context.read<AuthBloc>().add(
    //       StartTimer(),
    //     );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        title: Text(
          "Enter Digit Verification",
          style: textStyles.light.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.54.sp,
            color: ColorName.lightGreyText,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacer(80),
            Text(
              "Enter 4-digit",
              style: textStyles.semiBold.copyWith(
                color: ColorName.darkBlueText2,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Verification Code",
              style: textStyles.semiBold.copyWith(
                color: ColorName.darkBlueText2,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpacer(10),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Text(
                  "Code send to ${widget.email}. \n This code will expired in ",
                  style: textStyles.regular.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: ColorName.darkBlueText2,
                  ),
                );
              },
            ),
            verticalSpacer(60),
            OTPTextField(
              controller: otpFieldController,
              width: double.infinity,
              length: 6,
              onChanged: (value) {},
              onCompleted: (otp) {
                FocusScope.of(context).unfocus();
                context.read<AuthBloc>().add(
                      VerifyOTPLoading(),
                    );
                context.read<AuthBloc>().add(
                      VerifyOTP(
                        email: widget.email,
                        otp: otp,
                      ),
                    );
                // Handle completed OTP input
              },
            ),
            verticalSpacer(40),
            BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                return GenericButton(
                  isLoading: state.verifyOtpStatus == VerifyOtpStatus.loading
                      ? true
                      : false,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.hostPage,
                    );
                  },
                  buttonColor: ColorName.primaryColorLight,
                  buttonText: "Verify",
                );
              },
              listener: (context, state) {
                switch (state.verifyOtpStatus) {
                  case VerifyOtpStatus.init:
                    // TODO: Handle this case.
                    break;
                  case VerifyOtpStatus.loading:
                    // TODO: Handle this case.
                    break;
                  case VerifyOtpStatus.loaded:
                    // TODO: Handle this case.
                    break;
                  case VerifyOtpStatus.success:
                    widget.dashboardRoute == true
                        ? Navigator.pop(context)
                        : Navigator.pushNamed(
                            context,
                            AppRoutes.initializer,
                          );
                    state.verifyOtpStatus = VerifyOtpStatus.init;
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
