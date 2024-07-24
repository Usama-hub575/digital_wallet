import 'package:digital_wallet/export.dart';

late AppLabels labels;
late TextStyles textStyles;

bool _isInitialized = false;

void initializeResources({required BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  labels = AppLabels();
  textStyles = TextStyles();
}
