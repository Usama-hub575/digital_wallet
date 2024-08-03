import 'package:digital_wallet/export.dart';

class TransactionDetailScreen extends StatelessWidget {
  TransactionDetailScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
        title: Text(
          "Transaction Details",
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: ColorName.pureWhite,
          ),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              verticalSpacer(50),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
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
                  child: Column(
                    children: [
                      verticalSpacer(50),
                      Text(
                        "Rs 200",
                        style: textStyles.semiBold.copyWith(
                          color: ColorName.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 33.sp,
                        ),
                      ),
                      verticalSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                              Assets.svg.dummy,
                            ),
                          ),
                          horizontalSpacer(5),
                          BlocBuilder<DashboardBloc, DashboardState>(
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
                                    'Acc ${state.findUserResponseModel.id ?? ''}',
                                    style: textStyles.regular.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Transaction Details",
                          style: textStyles.semiBold.copyWith(
                            color: ColorName.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.textGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            "formattedDate",
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.textGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            "formattedTime",
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.textGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            color: ColorName.red,
                            child: Text(
                              'Paid',
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.pureWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Message",
                          style: textStyles.semiBold.copyWith(
                            color: ColorName.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 15.h,
                          ),
                          decoration: const BoxDecoration(
                            color: ColorName.dullWhite,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Payment for dinner",
                            style: textStyles.regular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      SizedBox(
                        width: 200.w,
                        child: ProceedButton(
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
