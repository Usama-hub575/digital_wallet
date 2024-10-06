import 'package:digital_wallet/export.dart';

class TransferSuccessfulScreen extends StatelessWidget {
  const TransferSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: "Successful",
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            verticalSpacer(20),
            Text(
              "Transfer Successful!",
              style: textStyles.semiBold.copyWith(
                fontSize: 32.sp,
                color: ColorName.primaryColorLight,
              ),
            ),
            verticalSpacer(10),
            Text(
              "Your money has been transferred successfully",
              textAlign: TextAlign.center,
              style: textStyles.medium.copyWith(
                fontSize: 18.sp,
                color: ColorName.textGrey,
              ),
            ),
            verticalSpacer(30),
            Assets.png.transferSuccessful.image(),
            Spacer(),
            GenericButton(
              buttonText: "View Receipt",
              buttonColor: ColorName.primaryColorLight,
              onTap: () => transactionSuccessfulBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }
}
