import 'package:digital_wallet/export.dart';

Future<void> electricitySummaryBottomSheet(
  BuildContext context,
) async {
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
      return IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Text(
                "Summary",
                style: textStyles.semiBold.copyWith(
                  fontSize: 22.sp,
                ),
              ),
              verticalSpacer(10),
              electricitySummaryWidget(
                title: "Ibadan Electric - IBEDC",
                value: "₦ 2,150",
              ),
              verticalSpacer(10),
              electricitySummaryWidget(
                title: "Meter Number",
                value: "9012345678",
              ),
              verticalSpacer(10),
              electricitySummaryWidget(
                title: "Customer Name",
                value: "JULIUS IJIDOLA",
              ),
              verticalSpacer(10),
              electricitySummaryWidget(
                title: "Total",
                value: "₦ 2,150",
              ),
              verticalSpacer(20),
              GenericButton(
                buttonText: "Pay ₦ 2,150",
                buttonColor: ColorName.primaryColorLight,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.paymentDetailScreen,
                   arguments:
                   {
                     "Email": "324trgfv",
                     "Amount": "2345"
                   }
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget electricitySummaryWidget({
  required String title,
  required String value,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 10.w,
      vertical: 20.h,
    ),
    decoration: BoxDecoration(
      color: ColorName.textGrey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyles.regular.copyWith(
            fontSize: 16.sp,
          ),
        ),
        Text(
          value,
          style: textStyles.regular.copyWith(
            fontSize: 16.sp,
            color: ColorName.primaryColorLight,
          ),
        ),
      ],
    ),
  );
}
