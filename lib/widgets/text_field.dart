import 'package:digital_wallet/export.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
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
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorName.grey.withOpacity(
          0.1,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            13,
          ),
          borderSide: const BorderSide(
            color: ColorName.red,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: BorderSide.none, // No border side
        ),
        hintText: hintText,
        hintStyle: textStyles.semiBold.copyWith(
          color: ColorName.grey.withOpacity(
            0.3,
          ),
        ),
      ),
    );
  }
}
