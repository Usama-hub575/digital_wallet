import 'package:digital_wallet/export.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: "Confirmation",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacer(20),
            Text(
              "Are you sure?",
              textAlign: TextAlign.center,
              style: textStyles.semiBold.copyWith(
                fontSize: 32.sp,
                color: ColorName.primaryColorLight,
              ),
            ),
            verticalSpacer(10),
            Text(
              "We care about your privacy. please make sure that you want to transfer money.",
              textAlign: TextAlign.center,
              style: textStyles.medium.copyWith(
                fontSize: 18.sp,
                color: ColorName.textGrey,
              ),
            ),
            verticalSpacer(50),
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: ColorName.textGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
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
                      top: -40,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Assets.png.dummy.image(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GenericButton(
              buttonText: "Send",
              buttonColor: ColorName.primaryColorLight,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.transferSuccessfulScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
