import 'package:digital_wallet/export.dart';

class SendToWalletWidget extends StatelessWidget {
  const SendToWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacer(50),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: ColorName.pureWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorName.dullWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      verticalSpacer(10),
                      SvgPicture.asset(
                        Assets.svg.sendToWallet,
                        width: 30.w,
                        height: 30.h,
                      ),
                      verticalSpacer(10),
                      Text(
                        'Send to Wallet',
                        style: textStyles.regular.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      verticalSpacer(10),
                    ],
                  ),
                ),
                verticalSpacer(20),
                Text(
                  'Latest Transfer',
                  style: textStyles.semiBold.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpacer(20),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      verticalSpacer(20),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.dummy,
                        ),
                        horizontalSpacer(20),
                        Column(
                          children: [
                            Text(
                              'Send Money',
                              style: textStyles.regular.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpacer(5),
                            Text(
                              'Yesterday. 19:12',
                              style: textStyles.regular.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorName.lightGreyText
                                    .withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '-Rs 600.000',
                          style: textStyles.semiBold.copyWith(
                            color: ColorName.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
