import 'package:digital_wallet/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
        title: Text(
          "Profile",
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
      ),
      body: Column(
        children: [
          verticalSpacer(50),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 20.h,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          minRadius: 30,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            Assets.svg.dummy,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                        horizontalSpacer(5),
                        Expanded(
                          child: BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.findUserResponseModel.username ?? '',
                                    style: textStyles.semiBold.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    'Acc ${state.findUserResponseModel.email ?? ''}',
                                    style: textStyles.regular.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      onTap: () {},
                      title: "Account Info",
                      svgImage: Assets.svg.accountInfo,
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "My Wallet",
                      svgImage: Assets.svg.myWallet,
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      onTap: () {},
                      title: "Transaction History",
                      svgImage: Assets.svg.transactionHistory,
                    ),
                    ProfileTile(
                      svgImage: Assets.svg.language,
                      onTap: () {},
                      title: "Language",
                    ),
                    verticalSpacer(10),
                    Divider(
                      color: ColorName.grey.withOpacity(0.3),
                      thickness: 1,
                    ),
                    ProfileTile(
                      svgImage: Assets.svg.generalSetting,
                      onTap: () {},
                      title: "General Setting",
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      svgImage: Assets.svg.changePassword,
                      onTap: () {},
                      title: "Change Password",
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "Change Login PIN",
                      svgImage: Assets.svg.changeLoginPin,
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "Become a merchant",
                      svgImage: Assets.svg.merchant,
                    ),
                    verticalSpacer(20),
                    ProfileTile(
                      svgImage: Assets.svg.faqs,
                      onTap: () {},
                      title: "FAQs",
                    ),
                    ProfileTile(
                      svgImage: Assets.svg.rateUs,
                      onTap: () {},
                      title: "Rate Us",
                    ),
                    verticalSpacer(20),
                    const OutlinedGenericButton(
                      buttonTitle: "Logout",
                      titleColor: ColorName.red,
                      outlinedButton: true,
                      borderColor: ColorName.red,
                    ),
                    verticalSpacer(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
