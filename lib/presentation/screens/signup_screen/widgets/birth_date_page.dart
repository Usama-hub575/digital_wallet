import 'package:digital_wallet/export.dart';
import 'package:intl/intl.dart';

class BirthDatePage extends StatelessWidget {
  BirthDatePage({super.key});

  TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(30),
          Text(
            "What is your date of birth?",
            style: textStyles.bold.copyWith(
              fontSize: 28.sp,
            ),
          ),
          verticalSpacer(20),
          Text(
            "We need your DOB to verify your account.",
            style: textStyles.regular.copyWith(
              fontSize: 13.sp,
            ),
          ),
          verticalSpacer(30),
          Text(
            "Date of birth",
            style: textStyles.semiBold.copyWith(
              fontSize: 14.sp,
            ),
          ),
          verticalSpacer(10),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorName.textGrey.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dobController.text.isEmpty
                      ? "MM/DD/YYYY" // Show placeholder if no date is selected
                      : dobController.text, // Display the selected date
                  style: textStyles.regular.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900), // The earliest date selectable
                      lastDate: DateTime.now(), // The latest date selectable
                    );

                    if (pickedDate != null) {
                      // Format the selected date and update the controller
                      String formattedDate =
                          DateFormat('MM/dd/yyyy').format(pickedDate);
                      dobController.text =
                          formattedDate; // Set the selected date in the TextField
                    }
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                fillColor: const WidgetStatePropertyAll(
                  ColorName.primaryColorLight,
                ),
                value: true,
                onChanged: (value) {},
              ),
              horizontalSpacer(10),
              Expanded(
                child: Text(
                  "Check box to be informed about marketing information or any special offer",
                  textAlign: TextAlign.start,
                  style: textStyles.regular.copyWith(
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          verticalSpacer(20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By registering, you agree to our ",
                  style: textStyles.bold.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: "Terms of use ",
                  style: textStyles.bold.copyWith(
                    fontSize: 12.sp,
                    color: ColorName.primaryColorLight,
                  ),
                ),
                TextSpan(
                  text: "and ",
                  style: textStyles.bold.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: "Privacy and Policies",
                  style: textStyles.bold.copyWith(
                    fontSize: 12.sp,
                    color: ColorName.primaryColorLight,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacer(30),
          GenericButton(
            buttonText: "Create Account",
            buttonColor: ColorName.primaryColorLight,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.allDoneScreen,
            ),
          ),
          verticalSpacer(20),
        ],
      ),
    );
  }
}
