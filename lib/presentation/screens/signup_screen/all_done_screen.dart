import 'package:digital_wallet/export.dart';

class AllDoneScreen extends StatelessWidget {
  const AllDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            const Spacer(),
            Assets.png.done.image(),
            verticalSpacer(50),
            Text(
              "All Done!",
              style: textStyles.bold.copyWith(
                fontSize: 24.sp,
                color: ColorName.pureWhite,
              ),
            ),
            verticalSpacer(10),
            Text(
              "Your account has been created. You're now ready to explore and enjoy all the features and benefits we have to offer.",
              textAlign: TextAlign.center,
              style: textStyles.regular.copyWith(
                fontSize: 13.sp,
                color: ColorName.pureWhite,
              ),
            ),
            const Spacer(),
            GenericButton(
              buttonText: "Start Exploring App",
              buttonColor: ColorName.pureWhite,
              buttonTextColor: ColorName.primaryColorLight,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.signInScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
