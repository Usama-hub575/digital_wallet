import 'package:digital_wallet/export.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(
        Colors.transparent,
      ),
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 80.w,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: ColorName.primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
            ),
            Text(
              title,
              style: textStyles.regular.copyWith(
                fontSize: 12.sp,
                color: ColorName.pureWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
