import 'package:digital_wallet/export.dart';

class HostPage extends StatelessWidget {
  HostPage({super.key});

  PersistentTabController controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: controller,
          screens: [
            DashboardScreen(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                Assets.svg.home,
              ),
            ),
            PersistentBottomNavBarItem(
              // inactiveColorPrimary: ColorName.pureWhite,
              // inactiveColorSecondary: ColorName.pureWhite,
              inactiveColorPrimary: ColorName.grey,
              activeColorPrimary: ColorName.primaryColorLight,
              activeColorSecondary: ColorName.primaryColorLight,
              icon: SvgPicture.asset(
                Assets.svg.report,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveColorPrimary: ColorName.pureWhite,
              inactiveColorSecondary: ColorName.pureWhite,
              activeColorPrimary: ColorName.primaryColorLight,
              activeColorSecondary: ColorName.primaryColorLight,
              icon: const Icon(
                Icons.qr_code_scanner,
                size: 30,
                color: ColorName.pureWhite,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveColorPrimary: ColorName.pureWhite,
              inactiveColorSecondary: ColorName.pureWhite,
              activeColorPrimary: ColorName.primaryColorLight,
              activeColorSecondary: ColorName.primaryColorLight,
              icon: SvgPicture.asset(
                Assets.svg.history,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveColorPrimary: ColorName.pureWhite,
              inactiveColorSecondary: ColorName.pureWhite,
              activeColorPrimary: ColorName.primaryColorLight,
              activeColorSecondary: ColorName.primaryColorLight,
              icon: SvgPicture.asset(
                Assets.svg.profile,
              ),
            ),
          ],
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }
}
