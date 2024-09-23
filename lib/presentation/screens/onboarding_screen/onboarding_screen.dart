import 'package:digital_wallet/export.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  PageController pageController = PageController(
    initialPage: 0,
  );

  List<Image> onboardingImages = [
    Assets.png.onboardingSendMoney.image(),
    Assets.png.onboardingRequestMoney.image(),
    Assets.png.onboardingEasyToUse.image(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.signInScreen,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Text(
                "Skip",
                style: textStyles.regular.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    context.read<AuthBloc>().add(
                          ChangeCurrentIndex(
                            currentIndex: index,
                          ),
                        );
                  },
                  physics: state.currentIndex == 2
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(20),
                        horizontal: horizontalValue(20),
                      ),
                      child: Column(
                        children: [
                          onboardingImages[index],
                          verticalSpacer(20),
                          Text(
                            state.onboardingContent[index]["title"],
                            style: textStyles.bold.copyWith(
                              fontSize: 22.sp,
                              color: ColorName.primaryColor,
                            ),
                          ),
                          verticalSpacer(20),
                          Text(
                            state.onboardingContent[index]["description"],
                            textAlign: TextAlign.center,
                            style: textStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: ColorName.grey,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 80,
                              top: 35,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                state.onboardingContent.length,
                                (index) => Container(
                                  height: verticalValue(15),
                                  width: horizontalValue(15),
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: state.currentIndex == index
                                        ? ColorName.primaryColor
                                        : ColorName.primaryColor
                                            .withOpacity(0.1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // const Spacer(),
              GenericButton(
                onTap: state.currentIndex == 2
                    ? () => Navigator.pushNamed(
                          context,
                          AppRoutes.signInScreen,
                        )
                    : () => pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 1,
                          ),
                          curve: Curves.bounceInOut,
                        ),
                buttonColor: ColorName.primaryColorLight,
                buttonText: state.currentIndex == 2 ? 'Continue' : 'Next',
              ),
            ],
          ),
        );
      }),
    );
  }
}
