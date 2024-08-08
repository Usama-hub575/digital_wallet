import 'package:digital_wallet/export.dart';

void successDialog(
  BuildContext context, {
  required String title,
  required String subTitle,
}) {
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
              title,
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
                subTitle,
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
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
