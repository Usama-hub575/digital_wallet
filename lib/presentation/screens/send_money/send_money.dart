import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/export.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration: BoxDecoration(
                    color: ColorName.pureWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorName.dullWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            verticalSpacer(10),
                            SvgPicture.asset(
                              Assets.svg.sendToWallet,
                              width: 30.w,
                              height: 30.h,
                            ),
                            verticalSpacer(10),
                            Text(
                              'Send to Wallet',
                              style: textStyles.regular.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            verticalSpacer(10),
                          ],
                        ),
                      ),
                      verticalSpacer(20),
                      Text(
                        'Latest Transfer',
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpacer(20),
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            verticalSpacer(20),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SvgPicture.asset(
                                Assets.svg.dummy,
                              ),
                              horizontalSpacer(20),
                              Column(
                                children: [
                                  Text(
                                    'Send Money',
                                    style: textStyles.regular.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  verticalSpacer(5),
                                  Text(
                                    'Yesterday. 19:12',
                                    style: textStyles.regular.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.lightGreyText
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '-Rs 600.000',
                                style: textStyles.semiBold.copyWith(
                                  color: ColorName.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              verticalSpacer(50),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorName.pureWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Email',
                                hintStyle: TextStyle(color: ColorName.grey),
                                // Optional: customize hint text color
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0), // Rounded corners
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Rounded corners
                                  borderSide: BorderSide(
                                      color: ColorName.grey,
                                      width: 1.0), // Border color and width
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // Rounded corners
                                  borderSide: BorderSide(
                                      color: ColorName.grey,
                                      width:
                                          2.0), // Border color and width when focused
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: ColorName
                                      .grey, // Optional: customize icon color
                                ),
                              ),
                            ),
                          ),
                          horizontalSpacer(20),
                          SvgPicture.asset(
                            Assets.svg.addIcon,
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Text(
                        'All Contact',
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpacer(20),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              verticalSpacer(20),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.svg.dummy,
                                ),
                                horizontalSpacer(20),
                                Column(
                                  children: [
                                    Text(
                                      'Send Money',
                                      style: textStyles.regular.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    verticalSpacer(5),
                                    Text(
                                      'Yesterday. 19:12',
                                      style: textStyles.regular.copyWith(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ColorName.lightGreyText
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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
                  decoration: BoxDecoration(
                    color: ColorName.pureWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child:  TextField(
                              decoration: InputDecoration(
                                hintText: 'Input Email',
                                hintStyle: TextStyle(color: ColorName.grey), // Optional: customize hint text color
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Adjust padding for better spacing
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 1.0), // Default border color and width
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorName.grey, width: 1.0), // Bottom border color and width when focused
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorName.grey, width: 1.0), // Bottom border color and width when not focused
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
                        'Latest Transfer',
                        style: textStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpacer(20),
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            verticalSpacer(20),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SvgPicture.asset(
                                Assets.svg.dummy,
                              ),
                              horizontalSpacer(20),
                              Column(
                                children: [
                                  Text(
                                    'Send Money',
                                    style: textStyles.regular.copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  verticalSpacer(5),
                                  Text(
                                    'Yesterday. 19:12',
                                    style: textStyles.regular.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.lightGreyText
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '-Rs 600.000',
                                style: textStyles.semiBold.copyWith(
                                  color: ColorName.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              )
                            ],
                          );
                        },
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
