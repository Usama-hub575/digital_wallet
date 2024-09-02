import 'package:digital_wallet/export.dart';

class MerchantGenericButton extends StatelessWidget {
  const MerchantGenericButton({
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

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
      child: isLoading == true
          ? Center(
              child: SizedBox(
                height: 21.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: ColorName.pureWhite,
                  backgroundColor: ColorName.primaryColor,
                ),
              ),
            )
          : Text(
              title,
              style: textStyles.regular.copyWith(
                fontSize: 14.sp,
                color: ColorName.pureWhite,
              ),
            ),
    );
  }
}
