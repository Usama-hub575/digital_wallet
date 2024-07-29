class EndPoints {
  final _baseUrl =
      'https://3182-182-177-46-237.ngrok-free.app/';
  final String _login = 'login/';
  final String _signup = 'signup/';
  final String _getProfile = 'GetProfile/';
  final String _verifyOTP = 'verifyOTP/';

  ///Getters

  String getLoginEndPoint() => '$_baseUrl$_login';

  String getSignUpEndPoint() => '$_baseUrl$_signup';

  String getProfileEndPoint() => '$_baseUrl$_getProfile';

  String getVerifyOTPEndPoint() => '$_baseUrl$_verifyOTP';
}
