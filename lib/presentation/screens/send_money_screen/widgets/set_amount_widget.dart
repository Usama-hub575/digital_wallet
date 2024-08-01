import 'package:digital_wallet/export.dart';

class SetAmountWidget extends StatelessWidget {
  SetAmountWidget({
    this.requestMoney = false,
    super.key,
  });

  TextEditingController amountController = TextEditingController();
  final bool? requestMoney;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacer(50),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
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
                Row(
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         decoration: InputDecoration(
                //           hintText: 'Input Email',
                //           hintStyle: textStyles.light.copyWith(
                //             fontSize: 13.sp,
                //             fontWeight: FontWeight.w400,
                //           ),
                //           // Optional: customize hint text color
                //           contentPadding: const EdgeInsets.symmetric(
                //             vertical: 15.0,
                //           ),
                //           // Adjust padding for better spacing
                //           border: const UnderlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.red,
                //               width: 1.0,
                //             ), // Default border color and width
                //           ),
                //           focusedBorder: const UnderlineInputBorder(
                //             borderSide: BorderSide(
                //               color: ColorName.grey,
                //               width: 1.0,
                //             ), // Bottom border color and width when focused
                //           ),
                //           enabledBorder: const UnderlineInputBorder(
                //             borderSide: BorderSide(
                //               color: ColorName.grey,
                //               width: 1.0,
                //             ), // Bottom border color and width when not focused
                //           ),
                //         ),
                //       ),
                //     ),
                //     horizontalSpacer(20),
                //     SvgPicture.asset(
                //       Assets.svg.contactBook,
                //     ),
                //   ],
                // ),
                verticalSpacer(20),
                Text(
                  'Set Amount',
                  style: textStyles.semiBold.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpacer(10),
                Align(
                  alignment: Alignment.center,
                  child: TextField(
                    controller: amountController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    // Numeric keyboard for number input
                    decoration: const InputDecoration(
                      hintText: "Rs 0",
                      border: InputBorder.none, // No border
                    ),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                verticalSpacer(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Notes',
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      horizontalSpacer(5),
                      Text(
                        '(Optional)',
                        style: textStyles.light.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(10),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 10.w,
                  ),
                  // Padding around the TextField
                  decoration: BoxDecoration(
                    color: ColorName.grey.withOpacity(0.1),
                    // Grey background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: TextField(
                    maxLines: 2, // Maximum number of lines
                    decoration: InputDecoration(
                      hintText: 'Write your notes',
                      hintStyle: textStyles.light.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      // No border for the TextField
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ), // Padding inside the TextField
                    ),
                  ),
                ),
                const Spacer(),
                BlocConsumer<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return ProceedButton(
                      onTap: () {
                        requestMoney == true
                            ? () {}
                            : showPinModalBottomSheet(
                                context,
                                amount: '30',
                                sendMoney: true,
                                email: state.findUserResponseModel.email,
                              );
                      },
                    );
                  },
                  listener: (BuildContext context, DashboardState state) {
                    switch (state.status) {
                      case DashboardStatus.success:
                        context.read<AuthBloc>().add(
                              GetProfile(),
                            );
                        state.status = DashboardStatus.init;
                        break;
                      case DashboardStatus.init:
                        break;
                      case DashboardStatus.loading:
                        break;
                      case DashboardStatus.loaded:
                        break;
                      case DashboardStatus.error:
                        showErrorToast(
                          message: state.errorMessage,
                          context: context,
                        );
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
