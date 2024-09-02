import 'package:digital_wallet/export.dart';

class BecomeMerchantScreen extends StatelessWidget {
  BecomeMerchantScreen({super.key});

  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController typeOfBusinessController = TextEditingController();
  TextEditingController monthlySalesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: const MerchantAppBar(
        title: "Become A Merchant",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
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
                style: textStyles.regular.copyWith(
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
                style: textStyles.regular.copyWith(
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
                style: textStyles.regular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalSpacer(20),
              Text(
                "Business Name",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                hintText: "Name",
                controller: businessNameController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterBusinessName;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "Business Address",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                hintText: "Enter your address",
                controller: businessAddressController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseEnterBusinessAddress;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "City",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                hintText: "Enter City",
                controller: cityController,
                readOnly: true,
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onSelected: (String value) {
                    cityController.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      'Islamabad',
                      'Lahore',
                      'Karachi',
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseSelectCity;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "Estimated Monthly Sales",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  onSelected: (String value) {
                    monthlySalesController.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      'PKR 10,000',
                      'PKR 20,000',
                      'PKR 13,000',
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
                hintText: "PKR 5000",
                controller: monthlySalesController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseSelectMonthlySales;
                  }
                  return null;
                },
              ),
              verticalSpacer(20),
              Text(
                "Type of Business",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onSelected: (String value) {
                    typeOfBusinessController.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      'Online',
                      'Import/Export',
                      'Wholesale',
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
                hintText: "Retailer",
                controller: typeOfBusinessController,
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConstants.pleaseSelectTypeOfBusiness;
                  }
                  return null;
                },
              ),
              verticalSpacer(30),
              InkWell(
                onTap: () => context.read<BecomeMerchantBloc>().add(
                      CaptureImage(),
                    ),
                child: SizedBox(
                  width: double.infinity,
                  child: DottedBorder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 25.h,
                    ),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 10],
                    color: ColorName.primaryColorLight,
                    strokeWidth: 2,
                    child: Center(
                      child: Text(
                        "Upload Photo or Your CNIC",
                        textAlign: TextAlign.center,
                        style: textStyles.regular.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(30),
              Text(
                "Location",
                style: textStyles.regular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              verticalSpacer(10),
              MerchantTextField(
                hintText: "Pick or Enter Location",
                controller: cityController,
                readOnly: true,
              ),
              verticalSpacer(20),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200.w,
                  child: BlocConsumer<BecomeMerchantBloc, BecomeMerchantState>(
                    builder: (context, state) {
                      return MerchantGenericButton(
                        isLoading: state.status == BecomeMerchantStatus.loading
                            ? true
                            : false,
                        title: "Submit",
                        onPressed: () {
                          context.read<BecomeMerchantBloc>().add(
                                MerchantLoading(),
                              );
                          context.read<BecomeMerchantBloc>().add(
                                CreateAndGetMerchant(
                                  payload: const {
                                    "bussiness_name": "store",
                                    "bussines_details":
                                        "my store has good things in it",
                                    "estimated_monthly_sales": "90000",
                                    "location": "abbottabad"
                                  },
                                ),
                              );
                        },
                      );
                    },
                    listener: (context, state) {
                      switch (state.status) {
                        case BecomeMerchantStatus.init:
                          // TODO: Handle this case.
                          break;
                        case BecomeMerchantStatus.loading:
                          // TODO: Handle this case.
                          break;
                        case BecomeMerchantStatus.success:
                          Navigator.pushNamed(
                            context,
                            AppRoutes.merchantQRScreen,
                          );
                          state.status = BecomeMerchantStatus.init;
                          break;
                        case BecomeMerchantStatus.error:
                          showErrorToast(
                            message: state.errorMessage,
                            context: context,
                          );
                          state.status = BecomeMerchantStatus.init;
                          break;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
