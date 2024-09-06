import 'package:digital_wallet/export.dart';

Future<void> showPinModalBottomSheet(
  BuildContext context, {
  bool? requestMoney = false,
  bool? sendMoney = false,
  String? requestID = '',
  bool? acceptMoney = false,
  String? amount,
  String? email,
}) async {
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    context: context,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 700.h,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      Assets.svg.authentication,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      Assets.svg.crossIcon,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                Assets.svg.enterPin,
              ),
              verticalSpacer(30),
              Text(
                'Enter Pin',
                style: textStyles.bold.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(30),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: ColorName.grey,
                  activeColor: ColorName.black,
                  disabledColor: ColorName.grey,
                  selectedColor: ColorName.black,
                  inactiveColor: ColorName.grey,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: ColorName.grey,
                ),
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                  if (requestMoney == true) {
                    context.read<DashboardBloc>().add(
                          RequestMoney(
                            email: email ?? '',
                            amount: amount ?? '',
                            secretKey: value,
                          ),
                        );
                  } else if (sendMoney == true) {
                    context.read<DashboardBloc>().add(
                          SendMoney(
                            email: email ?? '',
                            amount: amount ?? '',
                            secretKey: value,
                          ),
                        );
                  } else if (acceptMoney == true) {
                    context.read<DashboardBloc>().add(
                          AcceptMoney(
                            requestID: requestID ?? '',
                            secretKey: value,
                          ),
                        );
                  } else {
                    context.read<DashboardBloc>().add(
                          SetSecretKey(
                            secretKey: value,
                          ),
                        );
                  }
                },
              ),
              // confirmPin == true ? verticalSpacer(50) : const SizedBox.shrink(),
              // confirmPin == true
              //     ? GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: EdgeInsets.symmetric(
              //             horizontal: 15.w,
              //             vertical: 10.h,
              //           ),
              //           decoration: BoxDecoration(
              //             color: ColorName.primaryColor,
              //             borderRadius: BorderRadius.circular(
              //               25,
              //             ),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "Confirm Pin",
              //                 style: textStyles.light.copyWith(
              //                   color: ColorName.pureWhite,
              //                   fontWeight: FontWeight.w700,
              //                   fontSize: 16.sp,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
      );
    },
  );
}
