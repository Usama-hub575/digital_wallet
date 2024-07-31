import 'package:digital_wallet/export.dart';

class IconWithTextWidget extends StatelessWidget {
  const IconWithTextWidget({
    required this.icon,
    required this.title,
    this.showBackgroundColor = false,
    this.backgroundColor,
    super.key,
  });

  final String icon;
  final String title;
  final bool? showBackgroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showBackgroundColor == true
            ? Container(
                height: 50.h,
                width: 50.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor ?? ColorName.fadedBlue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SvgPicture.asset(
                  icon,
                ),
              )
            : SvgPicture.asset(
                icon,
              ),
        verticalSpacer(5), // Adjust spacing between icon and text
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: textStyles.regular.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
            color: ColorName.black,
          ),
        ),
      ],
    );
  }
}
