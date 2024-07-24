import 'package:digital_wallet/export.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorName.grey.withOpacity(
          0.1,
        ),
        // Grey filled color
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
