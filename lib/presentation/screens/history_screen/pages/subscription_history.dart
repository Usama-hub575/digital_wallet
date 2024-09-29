import 'package:digital_wallet/export.dart';

class SubscriptionHistoryPage extends StatelessWidget {
  const SubscriptionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Subscription History",
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
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
                              ? Assets.png.dropbox.image()
                              : Assets.png.apple.image(),
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
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
