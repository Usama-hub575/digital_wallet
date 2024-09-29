import 'package:digital_wallet/export.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "History",
        showNotificationIcon: true,
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          children: <Widget>[
            verticalSpacer(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction History",
                  style: textStyles.medium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutes.transactionHistoryPage,
                  ),
                  child: Text(
                    "See more",
                    style: textStyles.regular.copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                itemCount: 3,
              ),
            ),
            verticalSpacer(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subscription History",
                  style: textStyles.medium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutes.subscriptionHistoryPage,
                  ),
                  child: Text(
                    "See more",
                    style: textStyles.regular.copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final icon = index % 2 == 0;
                  return InkWell(
                    onTap: () => subscriptionBottomSheet(context),
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
                          icon
                              ? Assets.png.apple.image()
                              : Assets.png.dropbox.image(),
                          horizontalSpacer(10),
                          Column(
                            children: [
                              Text(
                                "Dropbox",
                                style: textStyles.medium.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "3 Days Ago",
                                style: textStyles.semiBold.copyWith(
                                  fontSize: 10.sp,
                                  color: ColorName.textGrey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$10.00",
                                  style: textStyles.regular.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: " USD",
                                  style: textStyles.light.copyWith(
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => verticalSpacer(10),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
