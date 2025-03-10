import 'package:digital_wallet/export.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.readOnly = true,
    this.focusedBorderColor = ColorName.textGrey,
    super.key,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? readOnly;
  final Color focusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      enabled: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            13,
          ),
          borderSide: const BorderSide(
            color: ColorName.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: BorderSide(
            color: focusedBorderColor.withOpacity(0.3),
          ), // No border side
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: BorderSide(
            color: ColorName.textGrey.withOpacity(0.3),
          ), // No border side
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: BorderSide(
            color: ColorName.textGrey.withOpacity(0.3),
          ), // No border side
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: const BorderSide(
            color: ColorName.grey,
          ), // No border side
        ),
        hintText: hintText,
        hintStyle: textStyles.regular.copyWith(
          fontSize: 13.sp,
          color: ColorName.grey.withOpacity(
            0.9,
          ),
        ),
      ),
    );
  }
}
