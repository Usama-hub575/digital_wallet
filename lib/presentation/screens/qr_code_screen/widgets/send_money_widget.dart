import 'package:digital_wallet/export.dart';

class SendMoneyWidget extends StatefulWidget {
  SendMoneyWidget({super.key});

  @override
  State<SendMoneyWidget> createState() => _SendMoneyWidgetState();
}

class _SendMoneyWidgetState extends State<SendMoneyWidget> {
  GlobalKey sendMoneyQRKey = GlobalKey(debugLabel: 'SendMoneyQR');
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
          key: sendMoneyQRKey,
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
