import 'package:digital_wallet/export.dart';

class ProfileActionWidget extends StatelessWidget {
  const ProfileActionWidget({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorName.textGrey.withOpacity(0.1),
              ),
            ),
            child: SvgPicture.asset(
              icon,
            ),
          ),
        ),
        verticalSpacer(10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyles.medium.copyWith(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
