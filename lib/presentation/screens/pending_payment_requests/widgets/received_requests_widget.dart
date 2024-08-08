import 'package:digital_wallet/export.dart';

class ReceivedRequestsWidget extends StatelessWidget {
  const ReceivedRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: state.requestsResponseModel.received.length,
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
                  Assets.svg.received,
                  height: 15.h,
                  width: 15.w,
                  color: ColorName.primaryColorLight,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              title: Text(
                state.requestsResponseModel.received[index].senderName
                    .toUpperCase(),
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
                  arguments: {
                    "data": state.requestsResponseModel.received[index],
                  },
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
