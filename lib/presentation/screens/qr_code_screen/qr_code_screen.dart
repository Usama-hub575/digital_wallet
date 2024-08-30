import 'package:digital_wallet/export.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorName.pureWhite,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            verticalSpacer(50),
            Text(
              "QR Code",
              style: textStyles.bold.copyWith(
                fontSize: 27.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalSpacer(10),
            Text(
              "Scan aQR code to start a transaction",
              style: textStyles.light.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            verticalSpacer(10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: verticalValue(10),
                  horizontal: horizontalValue(5),
                ),
                // margin: const EdgeInsets.only(bottom: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorName.pureWhite,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.grey,
                      offset: Offset(0.0, 3.0), //(x,y)
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: ColorName.primaryColorLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  indicatorColor: ColorName.primaryColorLight,
                  labelColor: ColorName.pureWhite,
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(10),
                  ),
                  overlayColor: const MaterialStatePropertyAll(
                    ColorName.primaryColor,
                  ),
                  tabs: const [
                    Tab(
                      text: "Send Money",
                    ),
                    Tab(
                      text: "Request Money",
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SendMoneyWidget(),
                  RequestMoneyWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
