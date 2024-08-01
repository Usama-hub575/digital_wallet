import 'package:digital_wallet/export.dart';

void passwordResetDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorName.pureWhite,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svg.successfulTick,
            ),
            verticalSpacer(10),
            Text(
              "Password Changed!",
              textAlign: TextAlign.center,
              style: textStyles.bold.copyWith(
                fontSize: 27.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        content: IntrinsicHeight(
          child: Column(
            children: [
              Text(
                "Your password has been changed successfully.",
                textAlign: TextAlign.center,
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(40),
              ProceedButton(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.signIn,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
