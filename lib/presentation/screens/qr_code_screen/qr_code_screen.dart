import 'package:digital_wallet/export.dart';

class QrCodeScreen extends StatefulWidget {
  QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

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
            Expanded(
              child: TabBarView(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            cutOutSize: 300,
                            borderWidth: 10,
                            borderColor: Colors.red,
                            borderRadius: 10,
                            borderLength: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            cutOutSize: 300,
                            borderWidth: 10,
                            borderColor: Colors.red,
                            borderRadius: 10,
                            borderLength: 30,
                          ),
                        ),
                      ),
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

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen(
      (scanData) {
        String? qrText = scanData.code;
      },
    );
  }
}
