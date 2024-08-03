import 'package:digital_wallet/export.dart';

class OutlinedGenericButton extends StatelessWidget {
  const OutlinedGenericButton({
    this.isLoading = false,
    this.outlinedButton = false,
    required this.buttonTitle,
    required this.titleColor,
    this.borderColor,
    this.onTap,
    super.key,
  });

  final bool? isLoading;
  final VoidCallback? onTap;
  final bool? outlinedButton;
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
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? ColorName.pureWhite,
          ),
          color:
              outlinedButton == true ? Colors.transparent : ColorName.pureWhite,
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: isLoading == true
            ? Center(
                child: SizedBox(
                  height: 23.h,
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
