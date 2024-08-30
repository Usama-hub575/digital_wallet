import 'package:digital_wallet/export.dart';

class MerchantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MerchantAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Text(
            "Help",
            style: textStyles.regular.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
      centerTitle: true,
      title: Text(
        "Become a Merchant",
        style: textStyles.light.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15.54.sp,
          color: ColorName.lightGreyText,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
