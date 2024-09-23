import 'package:digital_wallet/export.dart';

class ElectricityScreen extends StatelessWidget {
  ElectricityScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryColorLight,
      appBar: GenericAppBar(
        title: "Pay Electricity Bill",
      ),
      body: Column(
        children: [
          verticalSpacer(60),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
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
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: ColorName.grey,
                      ),
                      // Optional: customize hint text color
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Rounded corners
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        // Rounded corners
                        borderSide: const BorderSide(
                            color: ColorName.grey,
                            width: 1.0), // Border color and width
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        // Rounded corners
                        borderSide: const BorderSide(
                            color: ColorName.grey,
                            width: 2.0), // Border color and width when focused
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: ColorName.grey, // Optional: customize icon color
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 13,
                      separatorBuilder: (context, index) => Divider(
                        color: ColorName.grey.withOpacity(0.3),
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 35.h,
                            width: 35.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 7.w,
                              vertical: 7.h,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorName.grey.withOpacity(0.09),
                            ),
                            child: const Icon(
                              Icons.electric_bolt,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          onTap: () {},
                          title: Text(
                            "IDI Corp".toUpperCase(),
                            style: textStyles.semiBold.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.transactionDetailScreen,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
