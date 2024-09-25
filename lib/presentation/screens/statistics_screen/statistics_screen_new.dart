import 'package:digital_wallet/export.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendingGraphSyncfusion extends StatelessWidget {
  const SpendingGraphSyncfusion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Statistics",
        showBackButton: false,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                incomeContainer(
                  title: "Income",
                  amount: "\$956,000",
                  image: Assets.png.income.path,
                ),
                incomeContainer(
                  title: "Expenses",
                  amount: "\$3,000",
                  image: Assets.png.expenses.path,
                  arrowUp: true,
                ),
              ],
            ),
            verticalSpacer(10),
            Text(
              "Total Spending",
              style: textStyles.medium.copyWith(
                fontSize: 16.sp,
              ),
            ),
            verticalSpacer(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Text(
                    "Day",
                    style: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
                InkWell(
                  child: Text(
                    "Week",
                    style: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
                InkWell(
                  child: Text(
                    "Month",
                    style: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
                InkWell(
                  child: Text(
                    "Custom Range",
                    style: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(20),
            Flexible(
              child: SizedBox(
                height: 250,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelStyle: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    opposedPosition: true,
                    minimum: 0,
                    maximum: 600,
                    interval: 100,
                    maximumLabelWidth: 40,
                    labelFormat: '\${value}',
                    labelStyle: textStyles.medium.copyWith(
                      fontSize: 11.sp,
                      color: ColorName.textGrey,
                    ),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    SplineAreaSeries<SpendingData, String>(
                      dataSource: getSpendingData(),
                      xValueMapper: (SpendingData data, _) => data.day,
                      yValueMapper: (SpendingData data, _) => data.spent,
                      color: ColorName.primaryColorLight,
                      borderColor: ColorName.primaryColorLight,
                      borderWidth: 2,
                      gradient: LinearGradient(
                        colors: [
                          ColorName.primaryColorLight,
                          ColorName.primaryColorLight.withOpacity(0.1)
                        ],
                        stops: const [0.2, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacer(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                expenseWidget(
                  title: "Weekly Spend",
                  value: "\$ 1,454.00",
                ),
                expenseWidget(
                  title: "Shopping",
                  value: "\$ 890.00",
                ),
                expenseWidget(
                  title: "others",
                  value: "\$ 564.00",
                ),
              ],
            ),
            verticalSpacer(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                expenseWidget(
                  title: "Weekly Income",
                  value: "\$ 2,960.00",
                ),
                Text(
                  "See Details",
                  style: textStyles.medium.copyWith(
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget expenseWidget({
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: textStyles.medium.copyWith(
            fontSize: 11.sp,
          ),
        ),
        verticalSpacer(10),
        Text(
          value,
          style: textStyles.medium.copyWith(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  // Sample data for the spending graph
  List<SpendingData> getSpendingData() {
    return [
      SpendingData('Mon', 100),
      SpendingData('Tue', 200),
      SpendingData('Wed', 150),
      SpendingData('Thu', 267),
      SpendingData('Fri', 180),
      SpendingData('Sat', 120),
      SpendingData('Sun', 400),
    ];
  }
}

// Data class for the spending data
class SpendingData {
  SpendingData(this.day, this.spent);

  final String day;
  final double spent;
}

Widget incomeContainer({
  required String title,
  required String amount,
  required String image,
  bool arrowUp = false,
}) {
  return Container(
    width: 150.w,
    padding: EdgeInsets.symmetric(
      // horizontal: 30.w,
      vertical: 20.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          image,
        ),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: textStyles.medium.copyWith(
                fontSize: 12.sp,
              ),
            ),
            arrowUp
                ? Transform.rotate(
                    angle: 180 * (3.14159265359 / 180),
                    child: SvgPicture.asset(
                      Assets.svg.arrowCircleDown,
                    ),
                  )
                : SvgPicture.asset(
                    Assets.svg.arrowCircleDown,
                  ),
          ],
        ),
        verticalSpacer(10),
        Text(
          "\$956,000",
          style: textStyles.medium.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ],
    ),
  );
}
