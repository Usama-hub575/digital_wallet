class EndPoints {
  final _baseUrl =
      'https://0206-2400-adcc-909-fb00-2484-a94c-652d-fa67.ngrok-free.app/';
  final String _login = 'login/';
  final String _signup = 'signup/';
  final String _getProfile = 'GetProfile/';
  final String _verifyOTP = 'verifyOTP/';
  final String _setSecretKey = 'setSecretKey/';
  final String _sendMoney = 'sendMoney/';
  final String _findUser = 'findUser/';
  final String _forgetPassword = 'forgetPassword/';
  final String _resetPassword = 'resetPassword/';
  final String _requestMoney = 'RequestMoney/';
  final String _acceptMoney = 'AcceptMoneyRequest/';
  final String _getRequests = 'GetMoneyRequests/';
  final String _createAndGetMerchant = 'CreateAndGetMerchant/';
  final String _getMerchantDashboardData = 'GetMerchantDashboard/';
  final String _getMerchantSentTransactions = 'GetTransactions/merchant/sent/';
  final String _getMerchantSentPaginatedTransactions =
      'GetTransactions/merchant/sent/?page=';
  final String _getMerchantReceivedPaginatedTransactions =
      'GetTransactions/merchant/received/?page=';
  final String _getMerchantReceivedTransactions =
      'GetTransactions/merchant/received/';

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

  String getAndCreateMerchantEndPoint() => '$_baseUrl$_createAndGetMerchant';

  String getMerchantSentTransactionEndPoint() =>
      '$_baseUrl$_getMerchantSentTransactions';

  String getMerchantReceivedTransactionEndPoint() =>
      '$_baseUrl$_getMerchantReceivedTransactions';

  String getMerchantReceivedPaginatedTransactionEndPoint({
    required String page,
  }) =>
      '$_baseUrl$_getMerchantReceivedPaginatedTransactions$page';

  String getMerchantSentPaginatedTransactionEndPoint({
    required String page,
  }) =>
      '$_baseUrl$_getMerchantSentPaginatedTransactions$page';

  String getMerchantDashboardDataEndPoint() =>
      '$_baseUrl$_getMerchantDashboardData';
}
