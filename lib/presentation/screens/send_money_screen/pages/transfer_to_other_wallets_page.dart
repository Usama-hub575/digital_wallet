import 'package:digital_wallet/export.dart';

class TransferToOtherWallets extends StatelessWidget {
  TransferToOtherWallets({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.dullWhite,
      appBar: GenericAppBar(
        title: "Send Money",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transfer to Other Wallets",
              style: textStyles.semiBold.copyWith(
                fontSize: 20.sp,
              ),
            ),
            verticalSpacer(20),
            Text(
              "Search or select recipients",
              style: textStyles.medium.copyWith(
                fontSize: 16.sp,
              ),
            ),
            verticalSpacer(20),
            SearchField(
              emailController: searchController,
            ),
            verticalSpacer(30),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) => verticalSpacer(10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorName.pureWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.linkedin,
                        ),
                        horizontalSpacer(10),
                        Text(
                          "JazzCash",
                          style: textStyles.medium.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacer(),
                        Radio(
                          value: true,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            verticalSpacer(150),
            GenericButton(
              buttonText: "Continue",
              buttonColor: ColorName.primaryColorLight,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.addAccountDetailsPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
