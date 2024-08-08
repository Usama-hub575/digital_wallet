import 'package:digital_wallet/export.dart';

class WelcomeToMerchantScreen extends StatelessWidget {
  const WelcomeToMerchantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Become a Merchant",
          style: textStyles.light.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.54.sp,
            color: ColorName.lightGreyText,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.svg.becomeMerchant,
            ),
            verticalSpacer(10),
            Text(
              "Welcome to our \n Merchant Account",
              textAlign: TextAlign.center,
              style: textStyles.bold.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 28.sp,
              ),
            ),
            verticalSpacer(10),
            Flexible(
              child: Text(
                "If you are an individual or sole-propriator running a small business,you can sign-up as a merchant and instantly start receiving  payments from your customers today.",
                textAlign: TextAlign.center,
                style: textStyles.light.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Spacer(),
            GenericButton(
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.becomeMerchantScreen,
              ),
              buttonColor: ColorName.primaryColorLight,
              buttonText: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
