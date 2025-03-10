import 'package:digital_wallet/export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(50),
            SvgPicture.asset(
              Assets.svg.logo,
            ),
            verticalSpacer(10),
            Assets.png.welcomeLogo.image(),
            verticalSpacer(10),
            Text(
              "Manage your all finances within your Pocket.",
              style: textStyles.semiBold.copyWith(
                color: ColorName.primaryColorLight,
                fontSize: 34.sp,
              ),
            ),
            verticalSpacer(10),
            Text(
              "Manage your money, track your income and expenditure and spend daily in a smarter way.",
              style: textStyles.regular.copyWith(
                fontSize: 16.sp,
              ),
            ),
            verticalSpacer(150),
            GenericButton(
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.onboardingScreen,
              ),
              buttonColor: ColorName.primaryColorLight,
              buttonText: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
