import 'package:digital_wallet/export.dart';

class GenericOutlinedButton extends StatelessWidget {
  const GenericOutlinedButton({
    required this.buttonTitle,
    required this.titleColor,
    this.borderColor,
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  final String buttonTitle;
  final Color titleColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? ColorName.pureWhite,
          ),
          color: ColorName.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: textStyles.light.copyWith(
                color: titleColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
