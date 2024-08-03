class EndPoints {
  final _baseUrl = 'https://b9c1-182-177-39-208.ngrok-free.app/';
  final String _login = 'login/';
  final String _signup = 'signup/';
  final String _getProfile = 'GetProfile/';
  final String _verifyOTP = 'verifyOTP/';
  final String _setSecretKey = 'setSecretKey/';
  final String _sendMoney = 'sendMoney/';
  final String _findUser = 'findUser/';
  final String _forgetPassword = 'forgetPassword/';
  final String _resetPassword = 'resetPassword/';
  final String _requestMoney = 'GetMoneyRequests/';
  final String _acceptMoney = 'AcceptMoneyRequest/';
  final String _getRequests = 'GetMoneyRequests/';

  ///Getters

  String getLoginEndPoint() => '$_baseUrl$_login';

  String getSignUpEndPoint() => '$_baseUrl$_signup';

  String getProfileEndPoint() => '$_baseUrl$_getProfile';

  String getVerifyOTPEndPoint() => '$_baseUrl$_verifyOTP';

  String getSecretKeyEndPoint() => '$_baseUrl$_setSecretKey';

  String getSendMoneyEndPoint() => '$_baseUrl$_sendMoney';

  String getAcceptMoneyEndPoint() => '$_baseUrl$_acceptMoney';

  String getRequestMoneyEndPoint() => '$_baseUrl$_requestMoney';

  String getFindUserEndPoint() => '$_baseUrl$_findUser';

  String getForgetPasswordEndPoint() => '$_baseUrl$_forgetPassword';

  String getResetPasswordEndPoint() => '$_baseUrl$_resetPassword';

  String getRequestsEndPoint() => '$_baseUrl$_getRequests';
}
