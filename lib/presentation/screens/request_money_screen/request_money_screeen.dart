import 'package:digital_wallet/export.dart';

class RequestMoneyScreen extends StatelessWidget {
  RequestMoneyScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
        title: Text(
          "Request From",
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
        scrollDirection: Axis.horizontal,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SearchEmailWidget(
            controller: pageController,
          ),
          SetAmountWidget(
            requestMoney: true,
          ),
        ],
      ),
    );
  }
}
