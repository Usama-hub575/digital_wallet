import 'package:digital_wallet/export.dart';

class MerchantDashboardWidget extends StatelessWidget {
  const MerchantDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: ColorName.pureWhite,
              border: Border.all(
                color: ColorName.primaryColorLight,
              ),
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Qr and till Payment State",
                  style: textStyles.regular.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last one week",
                      style: textStyles.medium.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      onSelected: (String value) {
                        value;
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          'Last two week',
                          'Last three week',
                          'Last month',
                        ].map<PopupMenuItem<String>>(
                          (String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(20),
          PieChart(
            dataMap: const {
              "Payment Received": 50,
              'Payment Sent': 50,
            },
            colorList: [
              ColorName.primaryColorLight,
              ColorName.grey.withOpacity(0.5),
            ],
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
            ),
            chartRadius: 170,
            chartType: ChartType.ring,
            ringStrokeWidth: 18,
            centerWidget: Text(
              "Total Payments \n 5",
              textAlign: TextAlign.center,
              style: textStyles.semiBold.copyWith(
                fontSize: 13.sp,
              ),
            ),
            legendOptions: LegendOptions(
              showLegends: true,
              legendPosition: LegendPosition.bottom,
              legendTextStyle: textStyles.regular.copyWith(
                fontSize: 13.sp,
              ),
              legendShape: BoxShape.rectangle,
            ),
          ),
          verticalSpacer(20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: ColorName.pureWhite,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Payments Received",
                      style: textStyles.medium.copyWith(
                        fontSize: 13.sp,
                        color: ColorName.primaryColorLight,
                      ),
                    ),
                    Text(
                      "5",
                      style: textStyles.semiBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No.of Payments",
                      style: textStyles.medium.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "5",
                      style: textStyles.semiBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: ColorName.pureWhite,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Payments Sent",
                      style: textStyles.medium.copyWith(
                        fontSize: 13.sp,
                        color: ColorName.grey,
                      ),
                    ),
                    Text(
                      "5",
                      style: textStyles.semiBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "No.of Payments",
                      style: textStyles.medium.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "5",
                      style: textStyles.semiBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
