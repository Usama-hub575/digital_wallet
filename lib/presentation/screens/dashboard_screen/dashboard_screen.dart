import 'package:digital_wallet/export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool alertDialogShown = false;

  @override
  void initState() {
    super.initState();
    // context.read<DashboardBloc>().add(
    //       FullScreenLoading(),
    //     );
    // context.read<DashboardBloc>().add(
    //       GetProfile(),
    //     );
    // if (mounted) {
    //   if (context
    //               .read<DashboardBloc>()
    //               .state
    //               .getProfileResponseModel
    //               .emailVerfication ==
    //           false &&
    //       alertDialogShown == true) {
    //     WidgetsBinding.instance.addPostFrameCallback(
    //       (_) {
    //         showAlertDialog(context);
    //         alertDialogShown = true;
    //       },
    //     );
    //   }
    //   if (context
    //           .read<DashboardBloc>()
    //           .state
    //           .getProfileResponseModel
    //           .secretKeySet ==
    //       false) {
    //     WidgetsBinding.instance.addPostFrameCallback(
    //       (_) {
    //         showAlertDialog(
    //           context,
    //           emailVerified: false,
    //         );
    //       },
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorName.pureWhite,
          body: const Stack().fullScreenLoader(
            state: state.status == DashboardStatus.loading ? true : false,
            loadingWidget: fullScreenLoader(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(40),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          Assets.png.dummy.path,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      horizontalSpacer(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return Text(
                                'Hi, ${state.getProfileResponseModel.username}',
                                style: textStyles.semiBold.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              );
                            },
                          ),
                          Text(
                            'Welcome Back👋',
                            style: textStyles.regular.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                          AppRoutes.notificationScreen,
                        ),
                        child: SvgPicture.asset(
                          Assets.svg.notification,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacer(10),
                  Text(
                    'Total Balance',
                    style: textStyles.medium.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            '${state.getProfileResponseModel.money}',
                            style: textStyles.medium.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 20,
                              color: ColorName.black,
                              Icons.visibility_off,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  verticalSpacer(10),
                  SvgPicture.asset(
                    Assets.svg.dashboardCard,
                  ),
                  verticalSpacer(10),
                  Text(
                    "Actions",
                    style: textStyles.regular.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionsWidget(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.sendMoney,
                          );
                        },
                        icon: Assets.svg.send,
                        title: "Send",
                      ),
                      ActionsWidget(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.requestMoneyScreen,
                          );
                        },
                        icon: Assets.svg.request,
                        title: "Request",
                      ),
                      ActionsWidget(
                        onTap: () {
                          context.read<DashboardBloc>().add(
                                FullScreenLoading(),
                              );
                          context.read<DashboardBloc>().add(
                                GetRequests(),
                              );
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.paymentsScreen,
                          );
                        },
                        icon: Assets.svg.request,
                        title: "Payments",
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         sendMoneyDialog(context);
                  //       },
                  //       child: SvgPicture.asset(
                  //         Assets.svg.sendMoney,
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.of(context, rootNavigator: true).pushNamed(
                  //           AppRoutes.requestMoneyScreen,
                  //         );
                  //       },
                  //       child: SvgPicture.asset(
                  //         Assets.svg.requestMoney,
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         context.read<DashboardBloc>().add(
                  //               FullScreenLoading(),
                  //             );
                  //         context.read<DashboardBloc>().add(
                  //               GetRequests(),
                  //             );
                  //         Navigator.of(context, rootNavigator: true).pushNamed(
                  //           AppRoutes.pendingPaymentRequestsScreen,
                  //         );
                  //       },
                  //       child: SvgPicture.asset(
                  //         Assets.svg.pendingPayments,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  verticalSpacer(10),
                  Text(
                    "Services",
                    style: textStyles.regular.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          overlayColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          onTap: () => Navigator.of(context, rootNavigator: true)
                              .pushNamed(
                            AppRoutes.electricityScreen,
                          ),
                          child: SvgPicture.asset(
                            Assets.svg.electricity,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.internet,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.education,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.water,
                        ),
                      ),
                    ],
                  ),
                  // verticalSpacer(20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SvgPicture.asset(
                  //       Assets.svg.mobilePostpaid,
                  //     ),
                  //     SvgPicture.asset(
                  //       Assets.svg.gas,
                  //     ),
                  //     SvgPicture.asset(
                  //       Assets.svg.mobileCredit,
                  //     ),
                  //     SvgPicture.asset(
                  //       Assets.svg.healthInsurance,
                  //     ),
                  //   ],
                  // ),
                  verticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.mobilePostpaid2,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.creditCard,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.bankingFinance,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.svg.more,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
