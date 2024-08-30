import 'package:digital_wallet/export.dart';

class MerchantEWalletButton extends StatelessWidget {
  const MerchantEWalletButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          ColorName.pureWhite,
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 15.h,
          ),
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(
            color: ColorName.grey,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            Assets.svg.chatWithEWallet,
          ),
          Text(
            title,
            style: textStyles.regular.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
