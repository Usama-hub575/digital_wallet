import 'package:digital_wallet/export.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  GenericAppBar({
    required this.title,
    this.showNotificationIcon = false,
    super.key,
  });

  final String title;
  bool showNotificationIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: ColorName.pureWhite, //change your color here
      ),
      backgroundColor: ColorName.pureWhite,
      title: Text(
        title,
        style: textStyles.medium.copyWith(
          fontSize: 16.sp,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorName.black,
        ),
      ),
      actions: [
        showNotificationIcon
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutes.notificationScreen,
                  ),
                  child: SvgPicture.asset(
                    Assets.svg.notification,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
