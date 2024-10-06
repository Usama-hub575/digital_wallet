import 'package:digital_wallet/export.dart';

class SendMoneyScreen extends StatelessWidget {
  SendMoneyScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Send Money",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorName.primaryColorLight.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorName.textGrey.withOpacity(0.2),
                    spreadRadius: 8,
                    blurRadius: 30,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypeOfTransferWidget(
                        title: "Wallet Transfer",
                        icon: Assets.svg.sendToWallet,
                        onTap: () {},
                      ),
                      TypeOfTransferWidget(
                        title: "Bank Transfer",
                        icon: Assets.svg.bankTransfer,
                        onTap: () {},
                      ),
                      TypeOfTransferWidget(
                        title: "Cnic Transfer",
                        icon: Assets.svg.cnicTransfer,
                        onTap: () {},
                      ),
                    ],
                  ),
                  verticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypeOfTransferWidget(
                        title: "Scan \n QR",
                        icon: Assets.svg.scanQr,
                        onTap: () {},
                      ),
                      TypeOfTransferWidget(
                        title: "Paypal Transfer",
                        icon: Assets.svg.raastPayment,
                        onTap: () {},
                      ),
                      TypeOfTransferWidget(
                        title: "Other Wallets",
                        icon: Assets.svg.otherWallets,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.transferToOtherWalletsPage,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpacer(20),
            Text(
              "Frequent Transfer",
              style: textStyles.medium.copyWith(
                fontSize: 14.sp,
              ),
            ),
            verticalSpacer(20),
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          Assets.png.dummy.path,
                        ),
                      ),
                      Text(
                        "+34553456",
                        style: textStyles.regular.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return horizontalSpacer(10);
                },
                itemCount: 5,
              ),
            ),
            verticalSpacer(10),
            Text(
              "Recent Transfer",
              style: textStyles.medium.copyWith(
                fontSize: 14.sp,
              ),
            ),
            verticalSpacer(20),
            Flexible(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => transactionBottomSheet(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorName.primaryColorLight.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              Assets.png.dummy.path,
                            ),
                          ),
                          horizontalSpacer(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alia",
                                style: textStyles.medium.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "22 Jan 2022",
                                style: textStyles.semiBold.copyWith(
                                  fontSize: 10.sp,
                                  color: ColorName.textGrey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "+\$1,190.00",
                                style: textStyles.regular.copyWith(
                                  fontSize: 15.sp,
                                  color: ColorName.primaryColorLight,
                                ),
                              ),
                              Text(
                                "03:23 AM",
                                style: textStyles.medium.copyWith(
                                  fontSize: 9.sp,
                                  color: ColorName.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => verticalSpacer(10),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeOfTransferWidget extends StatelessWidget {
  const TypeOfTransferWidget({
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
      onTap: onTap,
      child: Container(
        // height: 80.h,
        width: 80.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorName.primaryColorLight.withOpacity(0.5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: textStyles.regular.copyWith(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PageView(
//   controller: pageController,
//   physics: const NeverScrollableScrollPhysics(),
//   children: [
//     SearchEmailWidget(
//       controller: pageController,
//     ),
//     SetAmountWidget(),
//   ],
// ),
