import 'package:digital_wallet/export.dart';

Future<void> transactionSuccessfulBottomSheet(
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
                    "David John",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                  verticalSpacer(20),
                  Text(
                    "2******6125",
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
                    title: "Card Type",
                    value: "Debit Card",
                  ),
                  verticalSpacer(10),
                  Divider(
                    thickness: 1,
                    color: ColorName.textGrey.withOpacity(0.5),
                  ),
                  verticalSpacer(10),
                  transactionDetailsWidget(
                    title: "Transfer Fee",
                    value: "\$0.00USD",
                  ),
                ],
              ),
              Positioned.fill(
                top: -45,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Assets.png.dummy.image(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
