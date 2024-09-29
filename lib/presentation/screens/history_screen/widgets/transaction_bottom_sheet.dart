import 'package:digital_wallet/export.dart';

Future<void> transactionBottomSheet(
  BuildContext context,
) async {
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
      return IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  verticalSpacer(20),
                  Text(
                    "Transfer Successful",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 22.sp,
                      color: ColorName.green,
                    ),
                  ),
                  verticalSpacer(10),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: ColorName.primaryColorLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      "Transaction Status : Sent",
                      style: textStyles.medium.copyWith(
                          fontSize: 14.sp, color: ColorName.primaryColorLight),
                    ),
                  ),
                  verticalSpacer(20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$8.50",
                          style: textStyles.semiBold.copyWith(
                            fontSize: 31.sp,
                          ),
                        ),
                        TextSpan(
                          text: " USD",
                          style: textStyles.semiBold.copyWith(
                            fontSize: 17.sp,
                            color: ColorName.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(20),
                  Text(
                    "To",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 17.sp,
                    ),
                  ),
                  verticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          Assets.png.dummy.path,
                        ),
                      ),
                      horizontalSpacer(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yasir Hassan",
                            style: textStyles.medium.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "Acc 23456765432456",
                            style: textStyles.medium.copyWith(
                              fontSize: 15.sp,
                              color: ColorName.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpacer(30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Transaction Details",
                      style: textStyles.medium.copyWith(
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  verticalSpacer(20),
                  transactionDetailsWidget(
                    title: "Payment",
                    value: "Rs. 400",
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Date",
                    value: "July 22, 2024",
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Time",
                    value: "12:30pm",
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Reference Number",
                    value: "QOIU-0012-ADFE-2234",
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Fee",
                    value: "Rs. 0",
                  ),
                  verticalSpacer(10),
                ],
              ),
              Positioned.fill(
                top: -50,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(Assets.svg.successfulTick),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
