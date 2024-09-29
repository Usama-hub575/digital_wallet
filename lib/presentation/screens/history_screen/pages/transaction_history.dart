import 'package:digital_wallet/export.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Transaction History",
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
