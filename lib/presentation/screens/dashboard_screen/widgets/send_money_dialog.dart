import 'package:digital_wallet/export.dart';

void sendMoneyDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: ColorName.pureWhite,
        title: Text(
          "Send Money To",
          textAlign: TextAlign.center,
          style: textStyles.bold.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: IntrinsicHeight(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.sendMoney,
                        );
                      },
                      child: IconWidget(
                        icon: Assets.svg.sendToWallet,
                        iconTitle: "Wallet \n Transfer",
                      ),
                    ),
                    IconWidget(
                      icon: Assets.svg.bankTransfer,
                      iconTitle: "Bank \n Transfer",
                    ),
                    IconWidget(
                      icon: Assets.svg.cnicTransfer,
                      iconTitle: "Cnic \n Transfer",
                    ),
                  ],
                ),
                verticalSpacer(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidget(
                      icon: Assets.svg.scanQr,
                      iconTitle: "Scan \n QR",
                    ),
                    IconWidget(
                      icon: Assets.svg.raastPayment,
                      iconTitle: "Raast \n Payment",
                    ),
                    IconWidget(
                      icon: Assets.svg.otherWallets,
                      iconTitle: "Other \n Wallets",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    required this.icon,
    required this.iconTitle,
    super.key,
  });

  final String icon;
  final String iconTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 6.w,
      ),
      decoration: BoxDecoration(
        color: ColorName.dullWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorName.grey.withOpacity(0.7),
            blurRadius: 4,
            offset: const Offset(1, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
          ),
          verticalSpacer(5),
          Text(
            iconTitle,
            textAlign: TextAlign.center,
            style: textStyles.semiBold.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
