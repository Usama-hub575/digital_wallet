import 'package:digital_wallet/export.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
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
                      Text(
                        'Hi, Abdullah',
                        style: textStyles.semiBold.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
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
                  SvgPicture.asset(
                    Assets.svg.myRewards,
                  ),
                ],
              ),
              verticalSpacer(30),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorName.primaryColorLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      right: 55,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          color: ColorName.pureWhite,
                          Icons.visibility_off,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Balance',
                            style: textStyles.regular.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorName.lightBlue,
                            ),
                          ),
                          Text(
                            'Rs. 24.321.90',
                            style: textStyles.regular.copyWith(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorName.pureWhite,
                            ),
                          ),
                          verticalSpacer(10),
                          Container(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconWithTextWidget(
                                  icon: Assets.svg.depositMoney,
                                  title: 'Deposit\n Money',
                                ),
                                IconWithTextWidget(
                                  icon: Assets.svg.sendMoney,
                                  title: 'Send\n Money',
                                ),
                                IconWithTextWidget(
                                  icon: Assets.svg.requestMoney,
                                  title: 'Request\n Money',
                                ),
                                IconWithTextWidget(
                                  icon: Assets.svg.recentHistory,
                                  title: 'Recent\n History',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.electricity,
                          title: 'Electricity',
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.internet,
                          title: 'Internet',
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.education,
                          title: 'Education',
                          backGroundColor:
                              ColorName.fadedOrange.withOpacity(0.4),
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.water,
                          title: 'Water',
                        ),
                      ],
                    ),
                    verticalSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.mobilePostPaid,
                          title: 'Mobile\n PostPaid',
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.gas,
                          title: 'Gas',
                          backGroundColor:
                              ColorName.fadedYellow.withOpacity(0.4),
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.mobileCredit,
                          title: 'Mobile Credit',
                        ),
                        IconWithTextWidget(
                          showBackgroundColor: true,
                          icon: Assets.svg.more,
                          title: 'More',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Transaction',
                    style: textStyles.semiBold.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'See All →',
                      style: textStyles.regular.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => verticalSpacer(20),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            Assets.svg.depositMoney,
                          ),
                          horizontalSpacer(20),
                          Column(
                            children: [
                              Text(
                                'Send Money',
                                style: textStyles.regular.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              verticalSpacer(5),
                              Text(
                                'Yesterday. 19:12',
                                style: textStyles.regular.copyWith(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      ColorName.lightGreyText.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '-Rs 600.000',
                            style: textStyles.semiBold.copyWith(
                              color: ColorName.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
