import 'package:digital_wallet/export.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(
          "SIGN Up",
          style: textStyles.light.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.54.sp,
            color: ColorName.lightGreyText,
          ),
        ),
      ),
      backgroundColor: ColorName.pureWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 5.h,
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => Container(
                      height: verticalValue(10),
                      width: horizontalValue(40),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: state.signupIndex == index
                            ? ColorName.primaryColorLight
                            : ColorName.primaryColorLight.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: PageView(
                    controller: pageController,
                    children: [
                      NamePage(
                        onTap: () {
                          pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceIn,
                          );
                        },
                      ),
                      BirthDatePage(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
