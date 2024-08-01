import 'package:digital_wallet/export.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
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
        title: Text(
          "Payment Details",
          style: textStyles.semiBold.copyWith(
            fontWeight: FontWeight.w700,
            color: ColorName.pureWhite,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      verticalSpacer(40),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 40.h,
                        ),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: ColorName.pureWhite,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Transfer Successful",
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Your transaction was successful",
                              style: textStyles.light.copyWith(
                                color: ColorName.textGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                            verticalSpacer(30),
                            Text(
                              "Rs 200",
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 33.sp,
                              ),
                            ),
                            verticalSpacer(30),
                            Text(
                              "Sent to",
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Abdul Mustakim',
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
                                            color: ColorName.textGrey,
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
                                  "Payment",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "Rp 200.000",
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
                                  "Date",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  'July 22, 2024',
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
                                  "20:32",
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
                                  "Reference Number",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "QOIU-0012-ADFE-2234",
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
                                  "Fee",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "Rs 0",
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
                                  "Total Payment",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.primaryColorLight,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  "Rs 200",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.primaryColorLight,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpacer(20),
                          ],
                        ),
                      ),
                      verticalSpacer(20),
                      const OutlinedGenericButton(
                        outlinedButton: true,
                        buttonTitle: "Share",
                        titleColor: ColorName.pureWhite,
                      ),
                      verticalSpacer(10),
                      const OutlinedGenericButton(
                        buttonTitle: "Back to home",
                        titleColor: ColorName.primaryColorLight,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    left: 150,
                    child: SvgPicture.asset(
                      Assets.svg.successfulTick,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
