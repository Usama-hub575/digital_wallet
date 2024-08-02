import 'package:digital_wallet/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.primaryColorLight,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColorLight,
        title: Text(
          "Profile",
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
      ),
      body: Column(
        children: [
          verticalSpacer(50),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 20.h,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: ColorName.pureWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          minRadius: 30,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            Assets.svg.dummy,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                        horizontalSpacer(5),
                        Expanded(
                          child: BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.findUserResponseModel.username ?? '',
                                    style: textStyles.semiBold.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    'Acc ${state.findUserResponseModel.email ?? ''}',
                                    style: textStyles.regular.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      addPadding: false,
                      onTap: () {},
                      title: "Referral code",
                    ),
                    ProfileTile(
                      addPadding: false,
                      onTap: () {},
                      title: "Language",
                    ),
                    verticalSpacer(10),
                    Text(
                      "Account".toUpperCase(),
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      onTap: () {},
                      title: "Edit Profile",
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "My Cards",
                    ),
                    verticalSpacer(10),
                    Text(
                      "Security".toUpperCase(),
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      onTap: () {},
                      title: "Change Security Code",
                    ),
                    verticalSpacer(10),
                    Text(
                      "General Info".toUpperCase(),
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    verticalSpacer(10),
                    ProfileTile(
                      onTap: () {},
                      title: "Help Center",
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "Resolution Center",
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "Terms & Condition",
                    ),
                    ProfileTile(
                      onTap: () {},
                      title: "Privacy Policy",
                    ),
                    verticalSpacer(10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.title,
    required this.onTap,
    this.addPadding = true,
    super.key,
  });

  final String title;
  final VoidCallback? onTap;
  final bool? addPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      title: addPadding == false
          ? Text(
              title.toUpperCase(),
              style: textStyles.semiBold.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Text(
                title.toUpperCase(),
                style: textStyles.semiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ),
    );
  }
}
