import 'package:digital_wallet/export.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.title,
    required this.onTap,
    required this.svgImage,
    super.key,
  });

  final String title;
  final VoidCallback? onTap;
  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35.h,
        width: 35.w,
        padding: EdgeInsets.symmetric(
          horizontal: 7.w,
          vertical: 7.h,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: ColorName.grey.withOpacity(0.09),
        ),
        child: SvgPicture.asset(
          svgImage,
          height: 15.h,
          width: 15.w,
          color: ColorName.primaryColorLight,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      title: Text(
        title.toUpperCase(),
        style: textStyles.semiBold.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ),
    );
  }
}
