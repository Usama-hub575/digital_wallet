import 'package:digital_wallet/export.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: "Payments",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(20),
            Text(
              "Mar 2021",
              style: textStyles.regular.copyWith(
                fontSize: 16.sp,
                color: ColorName.textGrey,
              ),
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorName.textGrey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            "S",
                            style: textStyles.medium.copyWith(
                              fontSize: 16.sp,
                              color: ColorName.primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpacer(10),
                      Column(
                        children: [
                          Text(
                            "Settlement",
                            style: textStyles.regular.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "12 Mar 2021",
                            style: textStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: ColorName.textGrey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "+ 32,123",
                        style: textStyles.medium.copyWith(
                          fontSize: 16.sp,
                          color: ColorName.green,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.h,
                    ),
                    child:  Divider(
                      color: ColorName.textGrey.withOpacity(0.2),
                      thickness: 1,
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
            verticalSpacer(20),
            Text(
              "Feb 2021",
              style: textStyles.regular.copyWith(
                fontSize: 16.sp,
                color: ColorName.textGrey,
              ),
            ),
            verticalSpacer(10),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorName.textGrey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            "S",
                            style: textStyles.medium.copyWith(
                              fontSize: 16.sp,
                              color: ColorName.primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpacer(10),
                      Column(
                        children: [
                          Text(
                            "Settlement",
                            style: textStyles.regular.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "12 Mar 2021",
                            style: textStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: ColorName.textGrey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "+ 32,123",
                        style: textStyles.medium.copyWith(
                          fontSize: 16.sp,
                          color: ColorName.green,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.h,
                    ),
                    child:  Divider(
                      color: ColorName.textGrey.withOpacity(0.2),
                      thickness: 1,
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
