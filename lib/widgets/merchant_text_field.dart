import 'package:digital_wallet/export.dart';

class MerchantTextField extends StatelessWidget {
  const MerchantTextField({
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ),
        suffixIcon: suffixIcon,
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
          borderSide: const BorderSide(
            color: ColorName.grey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: const BorderSide(
            color: ColorName.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: const BorderSide(
            color: ColorName.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // Half rounded corners
          borderSide: const BorderSide(
            color: ColorName.grey,
          ),
        ),
        hintText: hintText,
        hintStyle: textStyles.regular.copyWith(
          color: ColorName.grey.withOpacity(
            0.3,
          ),
        ),
      ),
    );
  }
}
