import 'package:digital_wallet/export.dart';

class WelcomeToMerchantScreen extends StatelessWidget {
  const WelcomeToMerchantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: const MerchantAppBar(
        title: "Become A Merchant ",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.svg.becomeAMerchant,
            ),
            verticalSpacer(10),
            Text(
              "More Control of your business with detailed payment transactions history available at your finger tips.",
              textAlign: TextAlign.justify,
              style: textStyles.regular.copyWith(
                fontSize: 13.sp,
              ),
            ),
            verticalSpacer(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Benefits of becoming an merchant:",
                textAlign: TextAlign.justify,
                style: textStyles.semiBold.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ),
            verticalSpacer(20),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.svg.calculator,
                ),
                horizontalSpacer(10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Get ",
                          style: textStyles.regular.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        TextSpan(
                          text: "500,000",
                          style: textStyles.semiBold.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        TextSpan(
                          text:
                              " monthly receiving & sending limits to help you with payments.",
                          style: textStyles.regular.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.svg.business,
                ),
                horizontalSpacer(10),
                Expanded(
                  child: Text(
                    "More Control of your business with detailed payment transactions history available at your finger tips.",
                    style: textStyles.regular.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.svg.cash,
                ),
                horizontalSpacer(10),
                Expanded(
                  child: Text(
                    "Expand your business with enhanced account limit of 500,000.",
                    style: textStyles.regular.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(50),
            Text(
              "See Video",
              style: textStyles.medium.copyWith(
                fontSize: 13.sp,
              ),
            ),
            const Spacer(),
            MerchantGenericButton(
              title: "Accept & Continue",
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.becomeMerchantScreen,
              ),
            ),
            verticalSpacer(10),
            Text(
              "By Clicking on “ Accept & Continue” you agree to our",
              style: textStyles.regular.copyWith(
                fontSize: 10.sp,
              ),
            ),
            Text(
              "Terms & Conditions",
              style: textStyles.regular.copyWith(
                fontSize: 10.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
