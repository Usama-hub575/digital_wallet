class EndPoints {
  final _baseUrl = 'https://3528-182-177-39-208.ngrok-free.app/';
  final String _login = 'login/';
  final String _signup = 'signup/';
  final String _getProfile = 'GetProfile/';
  final String _verifyOTP = 'verifyOTP/';
  final String _setSecretKey = 'setSecretKey/';
  final String _sendMoney = 'sendMoney/';
  final String _findUser = 'findUser/';

  ///Getters

  String getLoginEndPoint() => '$_baseUrl$_login';

  String getSignUpEndPoint() => '$_baseUrl$_signup';

  String getProfileEndPoint() => '$_baseUrl$_getProfile';

  String getVerifyOTPEndPoint() => '$_baseUrl$_verifyOTP';

  String getSecretKeyEndPoint() => '$_baseUrl$_setSecretKey';

  String getSendMoneyEndPoint() => '$_baseUrl$_sendMoney';

  String getFindUserEndPoint() => '$_baseUrl$_findUser';
}
