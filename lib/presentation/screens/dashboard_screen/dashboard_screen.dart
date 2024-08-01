import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/screens/dashboard_screen/widgets/send_money_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (context.read<AuthBloc>().state.getProfileResponseModel.secretKeySet ==
        false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAlertDialog(context);
      });
    }
    if (context
            .read<AuthBloc>()
            .state
            .getProfileResponseModel
            .emailVerfication ==
        false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAlertDialog(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorName.primaryColorLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                            return Text(
                              'Hi, ${state.getProfileResponseModel.username}',
                              style: textStyles.semiBold.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            );
                          }),
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
                      SvgPicture.asset(
                        Assets.svg.notification,
                      ),
                    ],
                  ),
                  verticalSpacer(30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    decoration: const BoxDecoration(
                      color: ColorName.pureWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          top: 20,
                          right: 105,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              color: ColorName.black,
                              Icons.visibility_off,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                Assets.svg.myRewards,
                              ),
                            ),
                            Text(
                              'Total Balance',
                              style: textStyles.regular.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpacer(10),
                            BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                              return Text(
                                'Rs. ${state.getProfileResponseModel.money}',
                                style: textStyles.regular.copyWith(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          sendMoneyDialog(context);
                        },
                        child: SvgPicture.asset(
                          Assets.svg.sendMoney,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.requestMoneyScreen,
                          );
                        },
                        child: SvgPicture.asset(
                          Assets.svg.requestMoney,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.svg.pendingPayments,
                      ),
                      SvgPicture.asset(
                        Assets.svg.recentHistory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(20),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.electricity,
                    ),
                    SvgPicture.asset(
                      Assets.svg.internet,
                    ),
                    SvgPicture.asset(
                      Assets.svg.education,
                    ),
                    SvgPicture.asset(
                      Assets.svg.water,
                    ),
                  ],
                ),
                verticalSpacer(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.mobilePostpaid,
                    ),
                    SvgPicture.asset(
                      Assets.svg.gas,
                    ),
                    SvgPicture.asset(
                      Assets.svg.mobileCredit,
                    ),
                    SvgPicture.asset(
                      Assets.svg.healthInsurance,
                    ),
                  ],
                ),
                verticalSpacer(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.mobilePostpaid2,
                    ),
                    SvgPicture.asset(
                      Assets.svg.creditCard,
                    ),
                    SvgPicture.asset(
                      Assets.svg.bankingFinance,
                    ),
                    SvgPicture.asset(
                      Assets.svg.more,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
