import 'package:digital_wallet/export.dart';

void showAlertDialog(
  BuildContext context, {
  bool? emailVerified = true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorName.pureWhite,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.svg.alertQuestionMark,
                ),
                verticalSpacer(20), // Add spacing between image and text
                Text(
                  emailVerified == false
                      ? 'Your secret key is not set. Please set it now.'
                      : 'Your email is not verified',
                  style: textStyles.light,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Positioned(
              right: -20,
              top: -10,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: ColorName.grey.withOpacity(0.4),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextButton(
              //   child: Text(
              //     'Cancel',
              //     style: textStyles.light.copyWith(
              //       color: ColorName.primaryColor,
              //     ),
              //   ),
              //   onPressed: () {
              //     // Handle "Set Key" action
              //     Navigator.of(context).pop();
              //     context.read<DashboardBloc>().add(
              //       GetProfile(),
              //     );
              //   },
              // ),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return SizedBox(
                    width: 200.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          ColorName.primaryColorLight,
                        ),
                      ),
                      child: Text(
                        emailVerified == false ? 'Ok' : 'Verify Email',
                        style: textStyles.light.copyWith(
                          color: ColorName.pureWhite,
                        ),
                      ),
                      onPressed: () {
                        // Handle "Set Key" action
                        Navigator.pop(context);
                        if (emailVerified == false) {
                          showPinModalBottomSheet(
                            context,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.verificationScreen,
                            arguments: {
                              'Email': state.getProfileResponseModel.email,
                              'Route': false,
                            },
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
