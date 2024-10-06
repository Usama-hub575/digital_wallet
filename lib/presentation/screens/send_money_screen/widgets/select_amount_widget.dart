import 'package:digital_wallet/export.dart';
class SelectAmountWidget extends StatelessWidget {
  const SelectAmountWidget({
    required this.onTap,
    required this.amount,
    super.key,
  });

  final String amount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 7.h,
        ),
        decoration: BoxDecoration(
          color: ColorName.textGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          amount,
          style: textStyles.regular.copyWith(
            fontSize: 22.sp,
          ),
        ),
      ),
    );
  }
}