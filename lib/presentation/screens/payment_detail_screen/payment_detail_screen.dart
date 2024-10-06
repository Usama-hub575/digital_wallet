import 'package:digital_wallet/export.dart';
import 'package:intl/intl.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({
    required this.amount,
    required this.email,
    super.key,
  });

  final String amount;
  final String email;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yy').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    return Scaffold(
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorName.primaryColorLight,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Icon(
              Icons.ios_share_rounded,
              color: ColorName.pureWhite,
            ),
          ),
        ],
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
                              style: textStyles.bold.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            verticalSpacer(10),
                            Text(
                              "Your transaction was successful",
                              style: textStyles.regular.copyWith(
                                color: ColorName.textGrey,
                                fontSize: 16.sp,
                              ),
                            ),
                            verticalSpacer(30),
                            Text(
                              "Total Payment",
                              style: textStyles.medium.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                            verticalSpacer(30),
                            Text(
                              "Rs $amount",
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.green,
                                fontSize: 24.sp,
                              ),
                            ),
                            verticalSpacer(20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorName.textGrey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.svg.linkedin,
                                  ),
                                  horizontalSpacer(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "LinkedIn",
                                        style: textStyles.medium.copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        "+3456598765",
                                        style: textStyles.medium.copyWith(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpacer(20),
                            GenericOutlinedButton(
                              buttonTitle: "Done",
                              titleColor: ColorName.black,
                              borderColor: ColorName.black,
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.hostPage,
                              ),
                            ),
                            // verticalSpacer(30),
                            // Text(
                            //   "Sent to",
                            //   style: textStyles.semiBold.copyWith(
                            //     color: ColorName.black,
                            //     fontWeight: FontWeight.w700,
                            //     fontSize: 15.sp,
                            //   ),
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     CircleAvatar(
                            //       backgroundColor: Colors.transparent,
                            //       child: SvgPicture.asset(
                            //         Assets.svg.dummy,
                            //       ),
                            //     ),
                            //     horizontalSpacer(5),
                            //     Expanded(
                            //       child: BlocBuilder<DashboardBloc,
                            //           DashboardState>(
                            //         builder: (context, state) {
                            //           return Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 email,
                            //                 style: textStyles.semiBold.copyWith(
                            //                   fontWeight: FontWeight.w500,
                            //                   fontSize: 16.sp,
                            //                 ),
                            //               ),
                            //               FittedBox(
                            //                 child: Text(
                            //                   'Acc ${state.findUserResponseModel.id ?? ''}',
                            //                   style:
                            //                       textStyles.regular.copyWith(
                            //                     fontWeight: FontWeight.w400,
                            //                     fontSize: 12.sp,
                            //                     color: ColorName.textGrey,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     "Transaction Details",
                            //     style: textStyles.semiBold.copyWith(
                            //       color: ColorName.black,
                            //       fontWeight: FontWeight.w700,
                            //       fontSize: 15.sp,
                            //     ),
                            //   ),
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Payment",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.textGrey,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       "Rs $amount",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.black,
                            //         fontWeight: FontWeight.w700,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Date",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.textGrey,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       formattedDate,
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.black,
                            //         fontWeight: FontWeight.w700,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Time",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.textGrey,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       formattedTime,
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.black,
                            //         fontWeight: FontWeight.w700,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Reference Number",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.textGrey,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       "QOIU-0012-ADFE-2234",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.black,
                            //         fontWeight: FontWeight.w700,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Fee",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.textGrey,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       "Rs 0",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.black,
                            //         fontWeight: FontWeight.w700,
                            //         fontSize: 11.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Total Payment",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.primaryColorLight,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 15.sp,
                            //       ),
                            //     ),
                            //     Text(
                            //       "Rs $amount",
                            //       style: textStyles.semiBold.copyWith(
                            //         color: ColorName.primaryColorLight,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 15.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // verticalSpacer(20),
                          ],
                        ),
                      ),
                      // verticalSpacer(20),
                      // const OutlinedGenericButton(
                      //   outlinedButton: true,
                      //   buttonTitle: "Share",
                      //   titleColor: ColorName.pureWhite,
                      // ),
                      // verticalSpacer(10),
                      // OutlinedGenericButton(
                      //   buttonTitle: "Back to home",
                      //   titleColor: ColorName.primaryColorLight,
                      //   onTap: () => Navigator.pushNamedAndRemoveUntil(
                      //     context,
                      //     AppRoutes.hostPage,
                      //     (route) => false,
                      //   ),
                      // ),
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
