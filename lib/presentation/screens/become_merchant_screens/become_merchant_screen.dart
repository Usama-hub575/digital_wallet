import 'package:digital_wallet/export.dart';

class BecomeMerchantScreen extends StatelessWidget {
  BecomeMerchantScreen({super.key});

  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController typeOfBusinessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Become a Merchant",
          style: textStyles.light.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.54.sp,
            color: ColorName.lightGreyText,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Malik Ahmed",
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(10),
              Text(
                "CNIC Number",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "xxxxx-xxxxxxxx-x",
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(10),
              Text(
                "Mobile Number",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "02345643456",
                style: textStyles.light.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(20),
              Text(
                "Business Name",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                hintText: "Name",
                controller: businessNameController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterYourName;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "Business Address",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                hintText: "Enter your address",
                controller: businessAddressController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterYourName;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "City",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                hintText: "Enter City",
                controller: cityController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterYourName;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "Type of Business",
                style: textStyles.bold.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(10),
              GenericTextField(
                hintText: "Retailer",
                controller: typeOfBusinessController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterYourName;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              MerchantOutlinedButton(
                buttonTitle: "Upload your photo",
                titleColor: ColorName.black,
                borderColor: ColorName.black,
              ),
              verticalSpacer(10),
              MerchantOutlinedButton(
                buttonTitle: "Upload your Cnic",
                titleColor: ColorName.black,
                borderColor: ColorName.black,
              ),
              verticalSpacer(20),
              GenericButton(
                onTap: () {},
                buttonColor: ColorName.primaryColorLight,
                buttonText: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
