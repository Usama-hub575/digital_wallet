// import 'package:digital_wallet/export.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   OnboardingScreen({super.key});
//
//   PageController pageController = PageController(
//     initialPage: 0,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: pageController,
//               onPageChanged: (index) {
//                 controller.currentIndex.value = index;
//               },
//               physics: controller.currentIndex.value == 2
//                   ? const NeverScrollableScrollPhysics()
//                   : const BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(
//                     vertical: verticalValue(20),
//                     horizontal: horizontalValue(20),
//                   ),
//                   child: Column(
//                     children: [
//                       const Spacer(),
//                       controller.onboardingContent[index]["image"],
//                       verticalSpacer(20),
//                       Text(
//                         controller.onboardingContent[index]["title"],
//                         style: textStyles.bold.copyWith(
//                           fontSize: sizes.fontRatio * 22,
//                           color: ColorName.primaryColor,
//                         ),
//                       ),
//                       verticalSpacer(20),
//                       Text(
//                         controller.onboardingContent[index]["description"],
//                         textAlign: TextAlign.center,
//                         style: textStyles.regular.copyWith(
//                           fontSize: sizes.fontRatio * 14,
//                           color: ColorName.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       Container(
//                         margin: const EdgeInsets.only(
//                           bottom: 80,
//                           top: 35,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List.generate(
//                             controller.onboardingContent.length,
//                             (index) => Container(
//                               height: verticalValue(15),
//                               width: horizontalValue(15),
//                               margin: const EdgeInsets.only(
//                                 right: 5,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: controller.currentIndex.value == index
//                                     ? ColorName.primaryColor
//                                     : ColorName.primaryColor.withOpacity(0.1),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       controller.currentIndex.value == 2
//                           ? CustomButton(
//                               onPressed: () => AppRoutes.appRoutes(
//                                 RouteNames.startupScreen,
//                               ),
//                               title: "Continue",
//                               isEnabled: true,
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 InkWell(
//                                   overlayColor: const WidgetStatePropertyAll(
//                                     Colors.transparent,
//                                   ),
//                                   onTap: () {},
//                                   child: Text(
//                                     "Skip",
//                                     style: textStyles.regular.copyWith(
//                                       color: ColorName.primaryColor,
//                                       fontSize: sizes.fontRatio * 18,
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   overlayColor: const WidgetStatePropertyAll(
//                                     Colors.transparent,
//                                   ),
//                                   onTap: () {
//                                     controller.pageController.nextPage(
//                                       duration: const Duration(
//                                         milliseconds: 1,
//                                       ),
//                                       curve: Curves.bounceInOut,
//                                     );
//                                     // controller.currentIndex.value.toDouble(),
//                                   },
//                                   child: Text(
//                                     "Next",
//                                     style: textStyles.semiBold.copyWith(
//                                       color: ColorName.primaryColor,
//                                       fontSize: sizes.fontRatio * 18,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
