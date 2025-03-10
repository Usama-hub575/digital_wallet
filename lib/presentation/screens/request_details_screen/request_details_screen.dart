import 'package:digital_wallet/export.dart';
import 'package:intl/intl.dart';

class RequestMoneyDetailsScreen extends StatelessWidget {
  const RequestMoneyDetailsScreen({
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
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const Icon(
        //     Icons.arrow_back_sharp,
        //     color: ColorName.pureWhite,
        //   ),
        // ),
        title: Text(
          "Request Details",
          style: textStyles.semiBold.copyWith(
            fontWeight: FontWeight.w700,
            color: ColorName.pureWhite,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
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
                              "Rs $amount",
                              style: textStyles.semiBold.copyWith(
                                color: ColorName.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 33.sp,
                              ),
                            ),
                            verticalSpacer(30),
                            Text(
                              "You requested to \n $email",
                              textAlign: TextAlign.center,
                              style: textStyles.light.copyWith(
                                color: ColorName.textGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                            verticalSpacer(20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Request Details",
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
                                  "You Requested",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  "Rs $amount",
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
                                  "Email",
                                  style: textStyles.semiBold.copyWith(
                                    color: ColorName.textGrey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  email,
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
                                  formattedDate,
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
                                  formattedTime,
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
                                  "Request ID",
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
                          ],
                        ),
                      ),
                      verticalSpacer(20),
                      const OutlinedGenericButton(
                        outlinedButton: true,
                        buttonTitle: "Download Receipt",
                        titleColor: ColorName.pureWhite,
                      ),
                      verticalSpacer(10),
                      const OutlinedGenericButton(
                        buttonTitle: "Share Receipt",
                        titleColor: ColorName.primaryColorLight,
                      ),
                      verticalSpacer(10),
                      OutlinedGenericButton(
                        buttonTitle: "Back to home",
                        titleColor: ColorName.primaryColorLight,
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.hostPage,
                              (route) => false,
                        ),
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
