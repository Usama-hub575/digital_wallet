import 'package:digital_wallet/export.dart';

class RequestMoneyWidget extends StatefulWidget {
  RequestMoneyWidget({super.key});

  @override
  State<RequestMoneyWidget> createState() => _RequestMoneyWidgetState();
}

class _RequestMoneyWidgetState extends State<RequestMoneyWidget> {
  GlobalKey requestMoneyQRKey = GlobalKey(debugLabel: 'RequestMoneyQR');
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 10.w,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        child: QRView(
          key: requestMoneyQRKey,
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
