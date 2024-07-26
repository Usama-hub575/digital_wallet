import 'package:digital_wallet/export.dart';

showErrorToast({
  required String message,
  bool? showErrorText,
  bool? fixSnackBar = false,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 3,
      ),
      backgroundColor: ColorName.pureWhite,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      content: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: horizontalValue(13),
              decoration: const BoxDecoration(
                color: ColorName.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(10),
                vertical: verticalValue(15),
              ),
              child: const Icon(
                Icons.cancel,
                size: 30,
                color: ColorName.red,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: horizontalValue(10),
                  vertical: verticalValue(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showErrorText == false
                        ? const SizedBox.shrink()
                        : Text(
                            AppConstants.error,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            style: textStyles.semiBold,
                          ),
                    Text(
                      message,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: textStyles.semiBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      behavior: fixSnackBar == true
          ? SnackBarBehavior.fixed
          : SnackBarBehavior.floating,
    ),
  );
}
