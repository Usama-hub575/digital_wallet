import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/export.dart';

void showAlertDialog(BuildContext context) {
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
          'Your secret key is not set. Please set it now.',
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
                  // Navigate to the key setting screen or perform an action
                },
              ),
              TextButton(
                child: Text(
                  'Set Key',
                  style: textStyles.light.copyWith(
                    color: ColorName.primaryColor,
                  ),
                ),
                onPressed: () {
                  // Handle "Set Key" action
                  Navigator.pop(context);
                  showPinModalBottomSheet(context,confirmPin: true);
                  // Navigate to the key setting screen or perform an action
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
