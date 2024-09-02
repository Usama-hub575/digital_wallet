import 'package:digital_wallet/export.dart';

class TransactionSummaryWidget extends StatelessWidget {
  const TransactionSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 20.w,
      ),
      child: BlocConsumer<BecomeMerchantBloc, BecomeMerchantState>(
        builder: (context, state) {
          return const Stack().fullScreenLoader(
            loadingWidget: fullScreenLoader(),
            state: state.status == BecomeMerchantStatus.loading ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 40.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorName.lightGreyText.withOpacity(0.1),
                        border: Border.all(
                          color: ColorName.grey.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Received",
                        style: textStyles.regular.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 50.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorName.primaryColorLight,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Sent",
                        style: textStyles.regular.copyWith(
                          fontSize: 12.sp,
                          color: ColorName.pureWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpacer(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Last Sync: 02/08/2021",
                      style: textStyles.medium.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.svg.refresh,
                    ),
                  ],
                ),
                verticalSpacer(20),
                Text(
                  "29 July 2021",
                  style: textStyles.medium.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpacer(10),
                Flexible(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Payment Received",
                                style: textStyles.regular.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rs.100",
                                style: textStyles.regular.copyWith(
                                  fontSize: 16.sp,
                                  color: ColorName.red,
                                ),
                              ),
                              horizontalSpacer(5),
                              Container(
                                height: 40.h,
                                width: 35.w,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorName.grey.withOpacity(0.3),
                                  ),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.visibility,
                                    color: ColorName.grey.withOpacity(0.7),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "2:16 AM",
                            style: textStyles.regular.copyWith(
                              fontSize: 12.sp,
                              color: ColorName.grey,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: ColorName.grey.withOpacity(0.4),
                    ),
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          switch (state.status) {
            case BecomeMerchantStatus.init:
            // TODO: Handle this case.
            case BecomeMerchantStatus.loading:
            // TODO: Handle this case.
            case BecomeMerchantStatus.success:
            // TODO: Handle this case.
            case BecomeMerchantStatus.error:
              showErrorToast(
                message: state.errorMessage,
                context: context,
              );
              state.status = BecomeMerchantStatus.init;
          }
        },
      ),
    );
  }
}
