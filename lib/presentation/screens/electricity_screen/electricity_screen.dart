import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/screens/electricity_screen/widgets/electricity_summary_bottom_sheet.dart';

class ElectricityScreen extends StatelessWidget {
  ElectricityScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Electricity Bill",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Disco",
                style: textStyles.semiBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacer(10),
              FilledTextField(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                ),
                controller: searchController,
                hintText: "Select Disco",
              ),
              verticalSpacer(20),
              Text(
                "Choose Meter Type",
                style: textStyles.semiBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacer(10),
              FilledTextField(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                ),
                controller: searchController,
                hintText: "Meter Type",
              ),
              verticalSpacer(20),
              Text(
                "Enter Meter Type",
                style: textStyles.semiBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacer(10),
              FilledTextField(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                ),
                controller: searchController,
                hintText: "Meter Number",
              ),
              verticalSpacer(20),
              Text(
                "Enter Amount",
                style: textStyles.semiBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              verticalSpacer(10),
              FilledTextField(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                ),
                controller: searchController,
                hintText: "Amount",
              ),
              verticalSpacer(100),
              GenericButton(
                buttonText: "Next",
                buttonColor: ColorName.primaryColorLight,
                onTap: () => electricitySummaryBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
