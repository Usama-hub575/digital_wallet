import 'package:digital_wallet/export.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    required this.amount,
    this.income = false,
    super.key,
  });

  final String amount;
  final bool income;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 25.w,
      ),
      decoration: BoxDecoration(
        color: income ?ColorName.primaryColorLight :ColorName.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            income ? Assets.svg.arrowCircleDown : Assets.svg.arrowCircleUp,
          ),
          horizontalSpacer(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$$amount",
                style: textStyles.semiBold.copyWith(
                  color: ColorName.pureWhite,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                income ? "Income" : "Expense",
                style: textStyles.light.copyWith(
                  color: ColorName.pureWhite,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
