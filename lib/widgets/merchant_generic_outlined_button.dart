import 'package:digital_wallet/export.dart';

class MerchantGenericOutlinedButton extends StatelessWidget {
  const MerchantGenericOutlinedButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          ColorName.pureWhite,
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 15.h,
          ),
        ),
        elevation: const WidgetStatePropertyAll(7),
        side: const WidgetStatePropertyAll(
          BorderSide(
            color: ColorName.primaryColorLight,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyles.medium.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
