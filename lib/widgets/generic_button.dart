import 'package:digital_wallet/export.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.height,
    this.width,
    this.radius = 7,
    this.buttonColor = ColorName.primaryColor,
    this.buttonTextColor = ColorName.pureWhite,
    this.fontWeight = FontWeight.w500,
    this.isLoading = false,
    this.border,
  });

  final String buttonText;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final double? radius;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final FontWeight? fontWeight;
  final Border? border;
  final bool? isLoading;

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
          boxShadow: [
            BoxShadow(
              color: ColorName.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: buttonColor,
          border: border,
          borderRadius: BorderRadius.circular(
            radius!,
          ),
        ),
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
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: textStyles.light.copyWith(
                      color: buttonTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
