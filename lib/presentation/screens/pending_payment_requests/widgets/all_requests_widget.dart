import 'package:digital_wallet/export.dart';

class AllRequestsWidget extends StatelessWidget {
  const AllRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
            List<dynamic> combinedList = [
              ...state.requestsResponseModel.sent.map((transaction) => {
                'type': 'sent',
                'data': transaction,
              }),
              ...state.requestsResponseModel.received.map((transaction) => {
                'type': 'received',
                'data': transaction,
              }),
            ];
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: combinedList.length,
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
                child: SvgPicture.asset(
                  combinedList[index]['data'],
                  height: 15.h,
                  width: 15.w,
                  color: ColorName.primaryColorLight,
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
              subtitle: Text(
                "Received",
                style: textStyles.semiBold.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  color: ColorName.grey.withOpacity(0.5),
                ),
              ),
              trailing: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.transactionDetailScreen,
                ),
                child: Text(
                  "See Detail",
                  style: textStyles.semiBold.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: ColorName.grey.withOpacity(0.9),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
