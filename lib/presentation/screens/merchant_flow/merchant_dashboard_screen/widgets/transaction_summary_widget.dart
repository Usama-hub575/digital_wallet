import 'package:digital_wallet/export.dart';

class TransactionSummaryWidget extends StatefulWidget {
  const TransactionSummaryWidget({super.key});

  @override
  State<TransactionSummaryWidget> createState() =>
      _TransactionSummaryWidgetState();
}

ScrollController _scrollController = ScrollController();

class _TransactionSummaryWidgetState extends State<TransactionSummaryWidget> {
  @override
  void initState() {
    super.initState();
    context.read<BecomeMerchantBloc>().add(
          MerchantLoading(),
        );
    context.read<BecomeMerchantBloc>().add(
          GetTransactions(
            sent: true,
          ),
        );
    // _scrollController.addListener(
    //   () {
    //     // Detect if user has scrolled to the bottom of the list
    //     if (_scrollController.position.pixels ==
    //             _scrollController.position.maxScrollExtent &&
    //         !context.read<BecomeMerchantBloc>().state.isLoading) {
    //       context.read<BecomeMerchantBloc>().add(
    //             GetTransactions(
    //               url: context
    //                   .read<BecomeMerchantBloc>()
    //                   .state
    //                   .transactionsResponseModel
    //                   .next,
    //             ),
    //           );
    //     }
    //   },
    // );
  }

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
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount:
                        state.transactionsResponseModel.results?.length ?? 0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // if (index == state.results?.length) {
                      //   return Center(
                      //     child: CircularProgressIndicator(),
                      //   ); // Loader for more data
                      // }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Payment Sent",
                                style: textStyles.regular.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                state.transactionsResponseModel.results?[index]
                                        .amount
                                        .toString() ??
                                    "0",
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
                  ),
                ),
                if (state.transactionsResponseModel.next != null &&
                    !state.isLoading)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<BecomeMerchantBloc>().add(
                              GetTransactions(
                                url: state.transactionsResponseModel.next,
                                sent: true,
                                page: state.sentTransactionCurrentPage,
                              ),
                            );
                      },
                      child: Text('Load More'),
                    ),
                  ),
                if (state.isLoading) Center(child: CircularProgressIndicator()),

                // No more data
                if (state.transactionsResponseModel.next == null)
                  Center(
                    child: Text(
                      "No more transactions",
                      style: textStyles.regular.copyWith(
                        fontSize: 14.sp,
                        color: ColorName.grey,
                      ),
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
              break;
            case BecomeMerchantStatus.loading:
              // TODO: Handle this case.
              break;
            case BecomeMerchantStatus.success:
              // TODO: Handle this case.
              break;
            case BecomeMerchantStatus.error:
              showErrorToast(
                message: state.errorMessage,
                context: context,
              );
              state.status = BecomeMerchantStatus.init;
              break;
          }
        },
      ),
    );
  }
}
