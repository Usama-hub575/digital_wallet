import 'dart:ffi';

import 'package:digital_wallet/export.dart';

Future<void> subscriptionBottomSheet(
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
                    "Apply Pay",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                  verticalSpacer(20),
                  Text(
                    "POS Signature Purchase",
                    style: textStyles.medium.copyWith(
                      fontSize: 14.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                  verticalSpacer(20),
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
                      "Transaction Status : Paid",
                      style: textStyles.medium.copyWith(
                        fontSize: 14.sp,
                        color: ColorName.primaryColorLight,
                      ),
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
                  transactionDetailsWidget(
                    title: "Transaction ID",
                    value: "14225055650",
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Posted Date",
                    value: "Sep 27, 2024",
                  ),
                ],
              ),
              Positioned.fill(
                top: -45,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Assets.png.apple.image(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
