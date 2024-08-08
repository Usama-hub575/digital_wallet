import 'package:digital_wallet/export.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primaryColorLight,
      appBar: const GenericAppBar(
        title: "History",
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
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 13,
                      separatorBuilder: (context, index) => Divider(
                        color: ColorName.grey.withOpacity(0.3),
                      ),
                      itemBuilder: (context, index) {
                        final bool isEven = index % 2 == 0 ? true : false;
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
                            child: SvgPicture.asset(
                              isEven
                                  ? Assets.svg.depositMoney
                                  : Assets.svg.sendMoney2,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          onTap: () {},
                          title: Text(
                            isEven
                                ? "Received Money".toUpperCase()
                                : "Sent Money".toUpperCase(),
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
