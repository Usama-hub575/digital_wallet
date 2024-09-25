import 'package:digital_wallet/export.dart';

Future<void> myQRBottomSheet(
  BuildContext context,
) async {
  GlobalKey sendMoneyQRKey = GlobalKey(
    debugLabel: 'SendMoneyQR',
  );
  QRViewController? controller;
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    context: context,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 500.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 7.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 7.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: ColorName.textGrey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              verticalSpacer(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My QR Code",
                    style: textStyles.semiBold.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  const Icon(
                    Icons.share_outlined,
                  ),
                ],
              ),
              verticalSpacer(50),
              Flexible(
                child: SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: QrImageView(
                    backgroundColor: ColorName.pureWhite,
                    data: 'This is a simple QR code',
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  ),
                ),
              ),
              verticalSpacer(30),
              Text(
                "Haris Siddiqui",
                style: textStyles.medium.copyWith(
                  fontSize: 17.sp,
                ),
              ),
              Text(
                "harris@gmail.com",
                style: textStyles.medium.copyWith(
                  fontSize: 15.sp,
                  color: ColorName.textGrey,
                ),
              ),
              verticalSpacer(20),
              Text(
                "Scan QR to receive Money",
                style: textStyles.medium.copyWith(
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _onQRViewCreated(QRViewController controller) {
  controller.scannedDataStream.listen(
    (scanData) {
      String? qrText = scanData.code;
    },
  );
}
