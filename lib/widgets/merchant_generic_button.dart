import 'package:digital_wallet/export.dart';

class MerchantGenericButton extends StatelessWidget {
  const MerchantGenericButton({
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
          ColorName.primaryColorLight,
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 40.w),
        ),
        elevation: const WidgetStatePropertyAll(5),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyles.regular.copyWith(
          fontSize: 14.sp,
          color: ColorName.pureWhite,
        ),
      ),
    );
  }
}
