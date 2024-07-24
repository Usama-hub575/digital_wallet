import 'package:digital_wallet/export.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController signInController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          centerTitle: true,
          title: Text(
            "SIGN Up",
            style: textStyles.light.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15.54.sp,
              color: ColorName.lightGreyText,
            ),
          ),
        ),
        backgroundColor: ColorName.pureWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacer(20),
                Center(
                  child: Text(
                    "Welcome To",
                    style: textStyles.bold.copyWith(
                      fontSize: 27.sp,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Name Start Now",
                    textAlign: TextAlign.center,
                    style: textStyles.bold.copyWith(
                      fontSize: 27.sp,
                    ),
                  ),
                ),
                verticalSpacer(30),
                GenericTextField(
                  hintText: "Name",
                  controller: signInController,
                ),
                verticalSpacer(20),
                GenericTextField(
                  hintText: "Email",
                  controller: signInController,
                ),
                verticalSpacer(20),
                GenericTextField(
                  hintText: "Password",
                  controller: signInController,
                ),
                verticalSpacer(20),
                GenericTextField(
                  hintText: "Confirm Password",
                  controller: signInController,
                ),
                verticalSpacer(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Term of use ",
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Or ",
                      style: textStyles.light.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "privacy notice",
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                verticalSpacer(50),
                const SmallButtonWidget(
                  buttonColor: ColorName.primaryColorLight,
                  buttonText: "Sign Up Now",
                ),
                verticalSpacer(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already Registered? ",
                      style: textStyles.light.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: textStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
