import 'package:digital_wallet/export.dart';

class SearchEmailWidget extends StatelessWidget {
  SearchEmailWidget({
    required this.controller,
    super.key,
  });

  final PageController controller;

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Search Email',
                    hintStyle: const TextStyle(
                      color: ColorName.grey,
                    ),
                    // Optional: customize hint text color
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      // Rounded corners
                      borderSide: const BorderSide(
                          color: ColorName.grey,
                          width: 1.0), // Border color and width
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      // Rounded corners
                      borderSide: const BorderSide(
                          color: ColorName.grey,
                          width: 2.0), // Border color and width when focused
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: ColorName.grey, // Optional: customize icon color
                    ),
                  ),
                ),
                verticalSpacer(70),
                BlocConsumer<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 200.w,
                      child: ProceedButton(
                        isLoading: state.status == DashboardStatus.buttonLoading
                            ? true
                            : false,
                        onTap: () {
                          context.read<DashboardBloc>().add(
                                ProceedButtonLoading(),
                              );
                          context.read<DashboardBloc>().add(
                                FindUser(
                                  email: emailController.text,
                                ),
                              );
                        },
                      ),
                    );
                  },
                  listener: (BuildContext context, DashboardState state) {
                    switch (state.status) {
                      case DashboardStatus.error:
                        showErrorToast(
                          message: state.errorMessage,
                          context: context,
                        );
                        state.status = DashboardStatus.init;
                        break;
                      case DashboardStatus.init:
                        break;
                      case DashboardStatus.buttonLoading:
                        break;
                      case DashboardStatus.loaded:
                        break;
                      case DashboardStatus.success:
                        controller.jumpToPage(2);
                        state.status = DashboardStatus.init;
                        break;
                      case DashboardStatus.sendMoneySuccess:
                      // TODO: Handle this case.
                      case DashboardStatus.requestMoneySuccess:
                        // TODO: Handle this case.
                      case DashboardStatus.pendingRequestsSuccess:
                        // TODO: Handle this case.
                      case DashboardStatus.acceptMoneySuccess:
                        // TODO: Handle this case.
                      case DashboardStatus.loading:
                        // TODO: Handle this case.
                    }
                  },
                ),

                // Text(
                //   'All Contact',
                //   style: textStyles.semiBold.copyWith(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // verticalSpacer(20),
                // Expanded(
                //   child: ListView.separated(
                //     physics: const BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     separatorBuilder: (context, index) =>
                //         verticalSpacer(20),
                //     itemCount: 3,
                //     itemBuilder: (context, index) {
                //       return Row(
                //         children: [
                //           SvgPicture.asset(
                //             Assets.svg.dummy,
                //           ),
                //           horizontalSpacer(20),
                //           Column(
                //             children: [
                //               Text(
                //                 'Send Money',
                //                 style: textStyles.regular.copyWith(
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               verticalSpacer(5),
                //               Text(
                //                 'Yesterday. 19:12',
                //                 style: textStyles.regular.copyWith(
                //                   fontSize: 11.sp,
                //                   fontWeight: FontWeight.w400,
                //                   color: ColorName.lightGreyText
                //                       .withOpacity(0.5),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           const Spacer(),
                //           const Icon(
                //             Icons.arrow_forward_ios_outlined,
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
