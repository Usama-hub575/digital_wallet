import 'package:digital_wallet/export.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.title,
    required this.onTap,
    required this.icon,
    required this.subtitle,
    this.showSwitchButton = false,
    super.key,
  });

  final String title;
  final VoidCallback? onTap;
  final String icon;
  final String subtitle;
  final bool showSwitchButton;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          color: ColorName.primaryColorLight,
        ),
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        title: Text(
          title,
          style: textStyles.medium.copyWith(
            fontSize: 12.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textStyles.medium.copyWith(
            fontSize: 10.sp,
          ),
        ),
        trailing: showSwitchButton
            ? Theme(
                data: Theme.of(context).copyWith(
                  switchTheme: SwitchThemeData(
                    thumbColor: WidgetStateProperty.all(ColorName.pureWhite),
                    trackColor:
                        WidgetStateProperty.all(ColorName.primaryColorLight),
                  ),
                ),
                child: Switch(
                  value: true,
                  thumbColor: const WidgetStatePropertyAll(
                    ColorName.pureWhite,
                  ),
                  onChanged: (value) {},
                  inactiveTrackColor: ColorName.textGrey,
                  activeColor: ColorName.primaryColorLight,
                  hoverColor: Colors.transparent,
                  focusColor: ColorName.primaryColorLight,
                ),
              )
            : IconButton(
                padding: EdgeInsets.zero,
                onPressed: onTap,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorName.textGrey,
                ),
              ),
      ),
    );
  }
}
