import 'package:digital_wallet/export.dart';

class ReceiveMoneyWidget extends StatelessWidget {
  const ReceiveMoneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                decoration: BoxDecoration(
                  color: ColorName.lightGreyText.withOpacity(0.1),
                  border: Border.all(
                    color: ColorName.grey.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  "Create QR Code",
                  style: textStyles.regular.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                decoration: BoxDecoration(
                  color: ColorName.primaryColorLight,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  "Create QR Code",
                  style: textStyles.regular.copyWith(
                    fontSize: 12.sp,
                    color: ColorName.pureWhite,
                  ),
                ),
              ),
            ],
          ),
          verticalSpacer(20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: ColorName.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                verticalSpacer(10),
                Text(
                  "Haris Enterprise 234",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpacer(10),
                SizedBox(
                  height: 230.h,
                  width: 230.w,
                  child: QrImageView(
                    backgroundColor: ColorName.pureWhite,
                    data: 'This is a simple QR code',
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  ),
                ),
                verticalSpacer(10),
                Text(
                  "Till ID : 83549",
                  style: textStyles.semiBold.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacer(30),
          SizedBox(
            width: double.infinity,
            child: MerchantGenericOutlinedButton(
              title: "Merchant Dashboard",
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.merchantDashboardScreen,
              ),
            ),
          ),
          verticalSpacer(20),
          SizedBox(
            width: double.infinity,
            child: MerchantGenericOutlinedButton(
              title: "View Profile",
              onPressed: () {},
            ),
          ),
          verticalSpacer(20),
          MerchantEWalletButton(
            title: "Chat with E-Wallet Agent",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
