import 'package:digital_wallet/export.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
        title: Text(
          "Send Money",
          style: textStyles.semiBold.copyWith(
            fontWeight: FontWeight.w700,
            color: ColorName.pureWhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.svg.help,
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: ColorName.pureWhite,
          ),
        ),
      ),
      body: PageView(
        children: [
          const SendToWalletWidget(),
          const AllContactWidget(),
          Column(
            children: [
              verticalSpacer(50),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Input Email',
                                hintStyle: textStyles.light.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                // Optional: customize hint text color
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),
                                // Adjust padding for better spacing
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ), // Default border color and width
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorName.grey,
                                    width: 1.0,
                                  ), // Bottom border color and width when focused
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorName.grey,
                                    width: 1.0,
                                  ), // Bottom border color and width when not focused
                                ),
                              ),
                            ),
                          ),
                          horizontalSpacer(20),
                          SvgPicture.asset(
                            Assets.svg.contactBook,
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Text(
                        'Set Amount',
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpacer(10),
                      Align(
                        alignment: Alignment.center,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          // Numeric keyboard for number input
                          decoration: const InputDecoration(
                            hintText: "Rs 0",
                            border: InputBorder.none, // No border
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Notes',
                              style: textStyles.semiBold.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            horizontalSpacer(5),
                            Text(
                              '(Optional)',
                              style: textStyles.light.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 10.w,
                        ),
                        // Padding around the TextField
                        decoration: BoxDecoration(
                          color: ColorName.grey.withOpacity(0.1),
                          // Grey background color
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: TextField(
                          maxLines: 2, // Maximum number of lines
                          decoration: InputDecoration(
                            hintText: 'Write your notes',
                            hintStyle: textStyles.light.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            // No border for the TextField
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ), // Padding inside the TextField
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showPinModalBottomSheet(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorName.primaryColor,
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Proceed to Transfer",
                                style: textStyles.light.copyWith(
                                  color: ColorName.pureWhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
