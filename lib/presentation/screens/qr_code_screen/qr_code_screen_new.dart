import 'package:digital_wallet/export.dart';

class QrCodeScreenNew extends StatelessWidget {
  const QrCodeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add QR to Pay",
          style: textStyles.medium.copyWith(
            fontSize: 16.sp,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => myQRBottomSheet(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: SvgPicture.asset(
                Assets.svg.qrIcon,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpacer(20),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200.w,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorName.textGrey.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Assets.svg.scanQrIcon,
                  ),
                  Text(
                    "Add from Gallery",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(50),
          Assets.png.mobileQr.image(),
        ],
      ),
    );
  }
}
