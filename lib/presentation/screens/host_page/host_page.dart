import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/bloc/host_bloc/export.dart';
import 'package:digital_wallet/presentation/screens/send_money/export.dart';

class HostPage extends StatelessWidget {
  HostPage({super.key});

  PersistentTabController controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.pureWhite,
      body: SafeArea(
        child: BlocBuilder<HostBloc, HostState>(builder: (context, state) {
          return PersistentTabView(
            context,
            controller: controller,
            screens: [
              DashboardScreen(),
              SendMoney(),
              Container(),
              Container(),
              Container(),
            ],
            onItemSelected: (index) {
              context.read<HostBloc>().add(
                    CurrentIndex(currentIndex: index),
                  );
              print(index.toString());
            },
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
                  color: state.currentIndex == 1
                      ? ColorName.primaryColorLight
                      : ColorName.grey,
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
                  color: state.currentIndex == 3
                      ? ColorName.primaryColorLight
                      : ColorName.grey,
                ),
              ),
              PersistentBottomNavBarItem(
                inactiveColorPrimary: ColorName.pureWhite,
                inactiveColorSecondary: ColorName.pureWhite,
                activeColorPrimary: ColorName.primaryColorLight,
                activeColorSecondary: ColorName.primaryColorLight,
                icon: SvgPicture.asset(
                  Assets.svg.profile,
                  color: state.currentIndex == 4
                      ? ColorName.primaryColorLight
                      : ColorName.grey,
                ),
              ),
            ],
            navBarStyle: NavBarStyle.style15,
          );
        }),
      ),
    );
  }
}
