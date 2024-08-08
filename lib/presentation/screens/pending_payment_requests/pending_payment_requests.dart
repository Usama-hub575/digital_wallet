import 'package:digital_wallet/export.dart';

class PendingPaymentRequestsScreen extends StatelessWidget {
  const PendingPaymentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorName.primaryColorLight,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorName.pureWhite, //change your color here
          ),
          backgroundColor: ColorName.primaryColorLight,
          title: Text(
            "Pending Requests",
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
        ),
        body: Column(
          children: [
            verticalSpacer(50),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
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
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return state.status == DashboardStatus.loading
                        ? Center(
                            child: SizedBox(
                              height: 40.h,
                              width: 38.w,
                              child: const CircularProgressIndicator(),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpacer(10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: verticalValue(8),
                                ),
                                // margin: const EdgeInsets.only(bottom: 6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: ColorName.grey.withOpacity(0.1),
                                ),
                                child: TabBar(
                                  labelPadding: EdgeInsets.zero,
                                  dividerColor: Colors.transparent,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                    color: ColorName.pureWhite,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        blurStyle: BlurStyle.normal,
                                        color: Colors.grey.withOpacity(0.1),
                                        offset: const Offset(1, 1),
                                        blurRadius: 80,
                                        spreadRadius: 8,
                                      ),
                                      BoxShadow(
                                        blurStyle: BlurStyle.normal,
                                        color: Colors.grey.withOpacity(0.1),
                                        offset: const Offset(-1.0, -1),
                                        blurRadius: 80,
                                        spreadRadius: 8,
                                      ),
                                    ],
                                  ),
                                  indicatorColor: ColorName.black,
                                  labelColor: ColorName.black,
                                  indicatorPadding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(18),
                                  ),
                                  overlayColor: const MaterialStatePropertyAll(
                                    ColorName.primaryColor,
                                  ),
                                  tabs: const [
                                    // Tab(
                                    //   text: "All",
                                    // ),
                                    Tab(
                                      text: "Received",
                                    ),
                                    Tab(
                                      text: "Sent",
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: TabBarView(
                                  children: [
                                    // AllRequestsWidget(),
                                    ReceivedRequestsWidget(),
                                    SentRequestsWidget(),
                                  ],
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
