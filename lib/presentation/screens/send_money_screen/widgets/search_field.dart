import 'package:digital_wallet/export.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Search Email',
        hintStyle: textStyles.regular
            .copyWith(fontSize: 11.sp, color: ColorName.textGrey),
        // Optional: customize hint text color
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // Rounded corners
          borderSide: BorderSide(
            color: ColorName.textGrey.withOpacity(0.3),
            width: 1.0,
          ), // Border color and width
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // Rounded corners
          borderSide: BorderSide(
            color: ColorName.textGrey.withOpacity(0.3),
            width: 2.0,
          ), // Border color and width when focused
        ),
        suffixIcon: Icon(Icons.search, color: ColorName.textGrey
            // Optional: customize icon color
            ),
      ),
    );
  }
}
