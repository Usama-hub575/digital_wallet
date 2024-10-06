import 'package:digital_wallet/export.dart';

class AddAccountDetails extends StatelessWidget {
  AddAccountDetails({super.key});

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController mmYYController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController paymentPurposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: "Send Money",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Account Details",
                style: textStyles.semiBold.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              verticalSpacer(10),
              FilledTextField(
                controller: cardHolderNameController,
                hintText: "Card Holder Name",
              ),
              verticalSpacer(10),
              FilledTextField(
                controller: cardNumberController,
                hintText: "Card Number",
              ),
              verticalSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilledTextField(
                      controller: mmYYController,
                      hintText: "MM/YY",
                    ),
                  ),
                  horizontalSpacer(20),
                  Expanded(
                    child: FilledTextField(
                      controller: cvvController,
                      hintText: "CVV",
                    ),
                  ),
                ],
              ),
              verticalSpacer(30),
              Text(
                "Enter Amount",
                style: textStyles.semiBold.copyWith(
                  fontSize: 19.sp,
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                focusedBorderColor: ColorName.primaryColorLight,
                controller: amountController,
                hintText: "Enter Amount",
              ),
              verticalSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectAmountWidget(
                    onTap: () {},
                    amount: "\$100",
                  ),
                  SelectAmountWidget(
                    onTap: () {},
                    amount: "\$200",
                  ),
                  SelectAmountWidget(
                    onTap: () {},
                    amount: "\$300",
                  ),
                ],
              ),
              verticalSpacer(30),
              Text(
                "Payment Purpose",
                style: textStyles.semiBold.copyWith(
                  fontSize: 19.sp,
                ),
              ),
              verticalSpacer(20),
              FilledTextField(
                controller: paymentPurposeController,
                hintText: "Purpose of Payment (Optional)",
              ),
              verticalSpacer(50),
              GenericButton(
                buttonText: "Continue",
                buttonColor: ColorName.primaryColorLight,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.viewDetailsPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
