import 'package:digital_wallet/export.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MerchantAppBar(
          title: "Dashboard",
        ),
        backgroundColor: ColorName.pureWhite,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            verticalSpacer(10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorName.grey.withOpacity(0.4),
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorWeight: 3,
                  indicatorColor: ColorName.primaryColorLight,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: ColorName.primaryColorLight,
                  overlayColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  labelStyle: textStyles.light.copyWith(
                    fontSize: 13.sp,
                  ),
                  tabs: const [
                    Tab(
                      text: "Merchant Dashboard",
                    ),
                    Tab(
                      text: "Transaction Summary",
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MerchantDashboardWidget(),
                  TransactionSummaryWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
