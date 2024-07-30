import 'package:digital_wallet/export.dart';

class AllContactWidget extends StatelessWidget {
  const AllContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
