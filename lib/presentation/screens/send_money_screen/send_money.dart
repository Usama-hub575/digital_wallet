import 'package:digital_wallet/export.dart';

class SendMoneyScreen extends StatelessWidget {
  SendMoneyScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Send Money",
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SearchEmailWidget(
            controller: pageController,
          ),
          SetAmountWidget(),
        ],
      ),
    );
  }
}
