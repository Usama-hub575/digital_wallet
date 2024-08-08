import 'package:digital_wallet/export.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GenericAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: ColorName.pureWhite, //change your color here
      ),
      backgroundColor: ColorName.primaryColorLight,
      title: Text(
        title,
        style: textStyles.semiBold.copyWith(
          fontWeight: FontWeight.w700,
          color: ColorName.pureWhite,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.svg.help,
          ),
        ),
      ],
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
