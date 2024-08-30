import 'package:digital_wallet/export.dart';

class MerchantQrScreen extends StatelessWidget {
  const MerchantQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MerchantAppBar(
          title: "QR Code",
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
                  labelStyle: textStyles.regular.copyWith(
                    fontSize: 15.sp,
                  ),
                  tabs: const [
                    Tab(
                      text: "Scan to Pay",
                    ),
                    Tab(
                      text: "Receive Money",
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ScanToPayWidget(),
                  ReceiveMoneyWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
