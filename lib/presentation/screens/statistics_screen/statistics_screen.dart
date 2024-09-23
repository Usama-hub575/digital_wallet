import 'package:digital_wallet/export.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  String selectedMonth = "July";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryColorLight,
      appBar: GenericAppBar(
        title: "Statistics",
      ),
      body: Column(
        children: [
          verticalSpacer(60),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AmountWidget(
                          amount: "400",
                          income: true,
                        ),
                        AmountWidget(
                          amount: "400",
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    Text("Activity",
                        style: textStyles.bold.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                        )),
                    verticalSpacer(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$selectedMonth 2024",
                          style: textStyles.semiBold.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: ColorName.textGrey,
                          ),
                        ),
                        Container(
                          width: 100.w,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorName.black,
                              width: 1,
                            ),
                            // Black border
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded corners
                          ),
                          child: DropdownButton<String>(
                            dropdownColor: ColorName.pureWhite,
                            value: selectedMonth,
                            items: <String>[
                              'July',
                              'August',
                              'September',
                              'October'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              selectedMonth = newValue!;
                            },
                            isExpanded: true,
                            // Expand to fill the container width
                            underline: const SizedBox.shrink(),
                            // Remove default underline
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: ColorName.black,
                            ), // Down arrow
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(15),
                    SfCartesianChart(
                      margin: EdgeInsets.zero,
                      primaryXAxis: const CategoryAxis(),
                      primaryYAxis: const NumericAxis(
                        minimum: 0,
                        maximum: 1000,
                        interval: 200,
                        labelFormat: '\${value}',
                        majorGridLines: MajorGridLines(
                          color: ColorName.black,
                          dashArray: [
                            5,
                            5
                          ], // Dotted lines with 5px dash and 5px gap
                        ),
                      ),
                      series: <CartesianSeries>[
                        ColumnSeries<ChartData, String>(
                          dataSource: [
                            ChartData('Week1', 300),
                            ChartData('Week2', 400),
                            ChartData('Week3', 500),
                            ChartData('Week4', 700),
                            ChartData('Week5', 900),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: ColorName.primaryColorLight,
                          width: 0.6,
                          spacing: 0.3,
                        ),
                        ColumnSeries<ChartData, String>(
                          dataSource: [
                            ChartData('Week1', 500),
                            ChartData('Week2', 900),
                            ChartData('Week3', 200),
                            ChartData('Week4', 700),
                            ChartData('Week5', 200),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          // Rounded bars
                          width: 0.6,
                          spacing: 0.3,
                          color: ColorName.primaryColor,
                        ),
                      ],
                    ),
                    verticalSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "History",
                          style: textStyles.semiBold.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          "See All",
                          style: textStyles.semiBold.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: ColorName.primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final bool isEven = index % 2 == 0 ? true : false;
                        return ListTile(
                          leading: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: isEven
                                  ? ColorName.yellow.withOpacity(0.09)
                                  : ColorName.shadedBlue.withOpacity(0.09),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Icon(
                              isEven ? Icons.event_note : Icons.electric_bolt,
                              color: isEven
                                  ? ColorName.yellow
                                  : ColorName.shadedBlue,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          onTap: () {},
                          title: Text(
                            isEven
                                ? "Monthly Electricity".toUpperCase()
                                : "Vehicle Tax".toUpperCase(),
                            style: textStyles.semiBold.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                          subtitle: Text(
                            "Yesterday 19:12",
                            style: textStyles.semiBold.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: ColorName.grey.withOpacity(0.5),
                            ),
                          ),
                          trailing: Text(
                            isEven ? "+Rs 300.00" : "-Rs 600.00",
                            style: textStyles.semiBold.copyWith(
                              color: isEven ? ColorName.green : ColorName.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: ColorName.grey.withOpacity(0.2),
                      ),
                      itemCount: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
