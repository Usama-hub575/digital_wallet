import 'package:digital_wallet/export.dart';

Widget transactionDetailsWidget({
  required String title,
  required String value,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: textStyles.medium.copyWith(
          fontSize: 15.sp,
          color: ColorName.textGrey,
        ),
      ),
      Text(
        value,
        style: textStyles.medium.copyWith(
          fontSize: 13.sp,
        ),
      ),
    ],
  );
}
