import 'package:digital_wallet/export.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({
    this.isLoading = false,
    this.onTap,
    super.key,
  });

  final bool? isLoading;
  final VoidCallback? onTap;

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
          color: ColorName.primaryColorLight,
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
                    "Proceed",
                    style: textStyles.light.copyWith(
                      color: ColorName.pureWhite,
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
