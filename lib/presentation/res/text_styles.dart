import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/gen/colors.gen.dart';

class TextStyles {
  final regular = const TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorName.primaryColor,
    fontFamily: "montserratRegular",
  );

  final medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorName.primaryColor,
    fontFamily: "montserratMedium",
  );

  final semiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorName.primaryColor,
    fontFamily: "montserratBold",
  );

  final bold = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorName.primaryColor,
    fontFamily: "montserratBold",
  );

  final extraBold = TextStyle(
    fontWeight: FontWeight.w900,
    color: ColorName.primaryColor,
    fontFamily: "montserratExtraBold",
  );
}
