import 'package:digital_wallet/export.dart';

class ViewDetailsPage extends StatelessWidget {
  const ViewDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: "Send Money",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recipient",
              style: textStyles.semiBold.copyWith(
                fontSize: 19.sp,
              ),
            ),
            verticalSpacer(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      Assets.png.dummy.path,
                    ),
                  ),
                  horizontalSpacer(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Haris",
                        style: textStyles.medium.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "1*****45",
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          color: ColorName.textGrey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    Assets.svg.editProfile,
                  ),
                ],
              ),
            ),
            verticalSpacer(10),
            Text(
              "Bank",
              style: textStyles.semiBold.copyWith(
                fontSize: 19.sp,
              ),
            ),
            verticalSpacer(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.svg.linkedin,
                  ),
                  horizontalSpacer(10),
                  Text(
                    "JazzCash",
                    style: textStyles.medium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            verticalSpacer(20),
            Text(
              "Transfer Details",
              style: textStyles.semiBold.copyWith(
                fontSize: 20.sp,
              ),
            ),
            verticalSpacer(10),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                color: ColorName.textGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  transferDetailsWidget(
                    title: "Transfer Amount",
                    value: "\$240.00",
                  ),
                  Divider(
                    thickness: 1,
                    color: ColorName.textGrey.withOpacity(0.5),
                  ),
                  verticalSpacer(10),
                  transferDetailsWidget(
                    title: "Transfer Fee",
                    value: "\$0.00",
                  ),
                  Divider(
                    thickness: 1,
                    color: ColorName.textGrey.withOpacity(0.5),
                  ),
                  verticalSpacer(10),
                  transferDetailsWidget(
                    title: "Total",
                    value: "\$240.00",
                  ),
                ],
              ),
            ),
            Spacer(),
            GenericButton(
              buttonText: "Continue",
              buttonColor: ColorName.primaryColorLight,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.confirmationPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
