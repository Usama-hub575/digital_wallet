import 'package:digital_wallet/export.dart';

class RequestMoneyScreen extends StatelessWidget {
  RequestMoneyScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Request Money",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Text(
              "Ask some one money you have owned",
              style: textStyles.regular.copyWith(
                fontSize: 14.sp,
              ),
            ),
            verticalSpacer(20),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 20.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.textGrey.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From:",
                    style: textStyles.regular.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  verticalSpacer(5),
                  Text(
                    "",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Divider(
                    color: ColorName.textGrey.withOpacity(0.5),
                    thickness: 1,
                  ),
                  verticalSpacer(10),
                  Text(
                    "You Send",
                    style: textStyles.regular.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  verticalSpacer(5),
                  Text(
                    "55000 Rs.",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              Assets.svg.toggleIcon,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.textGrey.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "To:",
                    style: textStyles.regular.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  verticalSpacer(5),
                  Text(
                    "",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Divider(
                    color: ColorName.textGrey.withOpacity(0.5),
                    thickness: 1,
                  ),
                  verticalSpacer(10),
                  Text(
                    "Recipient Gets:",
                    style: textStyles.regular.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  verticalSpacer(5),
                  Text(
                    "55000 Rs.",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(30),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Frequent Transfer",
                style: textStyles.medium.copyWith(
                  fontSize: 14.sp,
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: textStyles.medium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "See All",
                  style: textStyles.regular.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            verticalSpacer(20),
            Flexible(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => transactionBottomSheet(context),
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
                              "Payment Transferred to Jim",
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
                        Text(
                          "+\$1,190.00",
                          style: textStyles.regular.copyWith(
                            fontSize: 15.sp,
                            color: ColorName.primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => verticalSpacer(10),
                itemCount: 10,
              ),
            ),
            verticalSpacer(10),
            GenericButton(
              buttonText: "Next",
              buttonColor: ColorName.primaryColorLight,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.confirmationPage,
              ),
            ),
          ],
        ),
      ),

      // PageView(
      //   scrollDirection: Axis.horizontal,
      //   controller: pageController,
      //   physics: const NeverScrollableScrollPhysics(),
      //   children: [
      //     SearchEmailWidget(
      //       controller: pageController,
      //     ),
      //     SetAmountWidget(
      //       requestMoney: true,
      //     ),
      //   ],
      // ),
    );
  }
}
