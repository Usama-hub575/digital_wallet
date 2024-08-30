import 'package:digital_wallet/export.dart';

Widget fullScreenLoader() => Material(
  color: ColorName.primaryColor.withOpacity(0.05),
  child: InkWell(
    onTap: () {},
    splashColor: ColorName.primaryColorLight,
    hoverColor: ColorName.primaryColorLight,
    highlightColor: ColorName.primaryColor,
    child: Center(
      child: SizedBox(
        width: 30.w,
        height: 30.h,
        child: const CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(
            ColorName.primaryColor,
          ),
        ),
      ),
    ),
  ),
);