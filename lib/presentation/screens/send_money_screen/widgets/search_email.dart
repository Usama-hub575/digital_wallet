import 'package:digital_wallet/export.dart';

class SearchEmailWidget extends StatelessWidget {
  SearchEmailWidget({
    required this.controller,
    super.key,
  });

  final PageController controller;

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: 280.w,
                  child: SearchField(
                    emailController: emailController,
                  ),
                ),
              ),
              const Icon(
                Icons.add,
                color: ColorName.primaryColorLight,
              ),
            ],
          ),
          verticalSpacer(30),
          Text(
            "All Contact",
            style: textStyles.bold.copyWith(
              fontSize: 16.sp,
            ),
          ),
          Flexible(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: verticalValue(20),
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              Assets.png.dummy.path,
                            ),
                            radius: 25,
                          ),
                          horizontalSpacer(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alihakim@gmail.com",
                                style: textStyles.medium.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                              Text(
                                "+234324534532",
                                style: textStyles.medium.copyWith(
                                    fontSize: 13.sp, color: ColorName.textGrey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorName.grey.withOpacity(0.5),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpacer(10);
              },
              itemCount: 5,
            ),
          ),
          verticalSpacer(150),
          BlocConsumer<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200.w,
                  child: ProceedButton(
                    isLoading: state.status == DashboardStatus.buttonLoading
                        ? true
                        : false,
                    onTap: () {
                      context.read<DashboardBloc>().add(
                            ProceedButtonLoading(),
                          );
                      context.read<DashboardBloc>().add(
                            FindUser(
                              email: emailController.text,
                            ),
                          );
                    },
                  ),
                ),
              );
            },
            listener: (BuildContext context, DashboardState state) {
              switch (state.status) {
                case DashboardStatus.error:
                  showErrorToast(
                    message: state.errorMessage,
                    context: context,
                  );
                  state.status = DashboardStatus.init;
                  break;
                case DashboardStatus.init:
                  break;
                case DashboardStatus.buttonLoading:
                  break;
                case DashboardStatus.loaded:
                  break;
                case DashboardStatus.success:
                  controller.jumpToPage(2);
                  state.status = DashboardStatus.init;
                  break;
                case DashboardStatus.sendMoneySuccess:
                // TODO: Handle this case.
                case DashboardStatus.requestMoneySuccess:
                // TODO: Handle this case.
                case DashboardStatus.pendingRequestsSuccess:
                // TODO: Handle this case.
                case DashboardStatus.acceptMoneySuccess:
                // TODO: Handle this case.
                case DashboardStatus.loading:
                // TODO: Handle this case.
              }
            },
          )
        ],
      ),
    );
  }
}
