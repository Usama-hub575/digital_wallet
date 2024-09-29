import 'package:digital_wallet/export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Notification",
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(20),
            Text(
              "Today",
              style: textStyles.regular.copyWith(
                fontSize: 11.sp,
              ),
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final icon = index % 2 == 0;
                  return Row(
                    children: [
                      icon
                          ? SvgPicture.asset(
                              Assets.svg.withdrawMoney,
                            )
                          : Icon(
                              Icons.wallet,
                              color: ColorName.primaryColorLight,
                            ),
                      horizontalSpacer(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Withdrew N5,000",
                            style: textStyles.regular.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            "08:58 PM",
                            style: textStyles.regular.copyWith(
                              fontSize: 9.sp,
                              color: ColorName.textGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpacer(20);
                },
                itemCount: 5,
              ),
            ),
            verticalSpacer(20),
            Text(
              "Yesterday",
              style: textStyles.regular.copyWith(
                fontSize: 11.sp,
              ),
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final icon = index % 2 == 0;
                  return Row(
                    children: [
                      icon
                          ? SvgPicture.asset(
                              Assets.svg.withdrawMoney,
                            )
                          : Icon(
                              Icons.wallet,
                              color: ColorName.primaryColorLight,
                            ),
                      horizontalSpacer(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Withdrew N5,000",
                            style: textStyles.regular.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            "08:58 PM",
                            style: textStyles.regular.copyWith(
                              fontSize: 9.sp,
                              color: ColorName.textGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpacer(20);
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
