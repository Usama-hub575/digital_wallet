import 'package:digital_wallet/export.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.readOnly = true,
    super.key,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      enabled: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIconColor: ColorName.textGrey,
        filled: true,
        fillColor: ColorName.textGrey.withOpacity(0.2),
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
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ), // No border side
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
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
