class EndPoints {
  final _baseUrl =
      'https://8511-2400-adcc-909-fb00-64fe-520d-f218-45a.ngrok-free.app/';
  final String _login = 'login/';
  final String _signup = 'signup/';

  ///Getters

  String getLoginEndPoint() => '$_baseUrl$_login';

  String getSignUpEndPoint() => '$_baseUrl$_signup';
}
