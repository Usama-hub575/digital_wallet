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
        title: Row(
          children: [
            const Icon(
              Icons.warning_rounded,
              color: Colors.orange,
              size: 30,
            ),
            horizontalSpacer(10),
            Text(
              'Alert',
              style: textStyles.light,
            ),
          ],
        ),
        content: Text(
          emailVerified == false
              ? 'Your secret key is not set. Please set it now.'
              : 'Your email is not verified',
          style: textStyles.light,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: textStyles.light.copyWith(
                    color: ColorName.primaryColor,
                  ),
                ),
                onPressed: () {
                  // Handle "Set Key" action
                  Navigator.of(context).pop();
                  context.read<DashboardBloc>().add(
                    GetProfile(),
                  );
                },
              ),
              BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                return TextButton(
                  child: Text(
                    emailVerified == false ? 'Set Key' : 'Verify Email',
                    style: textStyles.light.copyWith(
                      color: ColorName.primaryColor,
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
                );
              }),
            ],
          ),
        ],
      );
    },
  );
}
