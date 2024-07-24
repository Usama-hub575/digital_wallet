import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/gen/colors.gen.dart';

class TextStyles {
  final regular = const TextStyle(
    color: ColorName.primaryColor,
    fontFamily: FontFamily.plusJakartaSansRegular,
  );

  final medium = const TextStyle(
    color: ColorName.primaryColor,
    fontFamily: FontFamily.plusJakartaSansMedium,
  );

  final semiBold = const TextStyle(

    color: ColorName.black,
    fontFamily: FontFamily.plusJakartaSansSemiBold,
  );

  final bold = const TextStyle(
    color: ColorName.black,
    fontFamily: FontFamily.plusJakartaSansBold,
  );

  final extraBold = const TextStyle(
    color: ColorName.primaryColor,
    fontFamily: FontFamily.plusJakartaSansExtraBold,
  );

  final light = const TextStyle(
    color: ColorName.black,
    fontFamily: FontFamily.plusJakartaSansLight,
  );
}
