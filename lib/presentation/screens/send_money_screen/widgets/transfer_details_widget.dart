import 'package:digital_wallet/export.dart';

Widget transferDetailsWidget({
  required String title,
  required String value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: textStyles.medium.copyWith(
          fontSize: 18.sp,
          color: ColorName.textGrey,
        ),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: value,
              style: textStyles.semiBold.copyWith(
                fontSize: 20.sp,
              ),
            ),
            TextSpan(
              text: "USD",
              style: textStyles.semiBold.copyWith(
                fontSize: 9.sp,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
