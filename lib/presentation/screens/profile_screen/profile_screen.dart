import 'package:digital_wallet/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.pureWhite,
      appBar: GenericAppBar(
        title: "Profile",
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            verticalSpacer(30),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorName.primaryColorLight.withOpacity(0.4),
                  radius: 41,
                  child: CircleAvatar(
                    backgroundColor:
                        ColorName.primaryColorLight.withOpacity(0.4),
                    radius: 38,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.png.dummy.path,
                      ),
                      radius: 35,
                    ),
                  ),
                ),
                horizontalSpacer(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Haris Siddiqui",
                      style: textStyles.medium.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "2345634563",
                          style: textStyles.regular.copyWith(
                            fontSize: 10.sp,
                            color: ColorName.textGrey,
                          ),
                        ),
                        horizontalSpacer(10),
                        SvgPicture.asset(
                          Assets.svg.blueVerifiedTick,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "abdulaleem@gmail.com",
                          style: textStyles.regular.copyWith(
                            fontSize: 10.sp,
                            color: ColorName.textGrey,
                          ),
                        ),
                        horizontalSpacer(10),
                        SvgPicture.asset(
                          Assets.svg.blueVerifiedTick,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  Assets.svg.editProfile,
                ),
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                horizontalSpacer(20),
                SvgPicture.asset(
                  Assets.svg.greenVerifiedTick,
                ),
                horizontalSpacer(5),
                Text(
                  "Verified",
                  style: textStyles.medium.copyWith(
                    fontSize: 9.sp,
                    color: ColorName.green,
                  ),
                ),
              ],
            ),
            verticalSpacer(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileActionWidget(
                  icon: Assets.svg.changePin,
                  title: "Change Pin",
                ),
                ProfileActionWidget(
                  icon: Assets.svg.myQrCode,
                  title: "My QR Code",
                ),
                ProfileActionWidget(
                  icon: Assets.svg.support,
                  title: "Help & Support",
                ),
              ],
            ),
            verticalSpacer(30),
            ProfileTile(
              subtitle: "Manage your accounts",
              onTap: () {},
              icon: Assets.svg.accounts,
              title: "Accounts",
            ),
            ProfileTile(
              subtitle: "You can change the app language",
              onTap: () {},
              icon: Assets.svg.language,
              title: "Language",
            ),
            ProfileTile(
              subtitle: "Manage touch ID or face ID",
              onTap: () {},
              icon: Assets.svg.screenLock,
              title: "Screen Lock",
            ),
            ProfileTile(
              showSwitchButton: true,
              subtitle: "Switch between light & dark mode",
              onTap: () {},
              icon: Assets.svg.lightMode,
              title: "Light Mode",
            ),
          ],
        ),
      ),
    );
  }
}
