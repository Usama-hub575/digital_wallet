class GetProfileResponseModel {
  String? tokenType;
  int? exp;
  int? iat;
  String? jti;
  String? userId;
  String? email;
  String? username;
  int? money;
  String? id;
  bool? emailVerfication;
  bool? secretKeySet;
  bool? isMerchant;

  GetProfileResponseModel({
    this.tokenType,
    this.exp,
    this.iat,
    this.jti,
    this.userId,
    this.email,
    this.username,
    this.money,
    this.id,
    this.emailVerfication,
    this.secretKeySet,
    this.isMerchant,
  });

  static GetProfileResponseModel empty() {
    return GetProfileResponseModel(
      email: '',
      emailVerfication: false,
      exp: 0,
      iat: 0,
      id: '',
      jti: '',
      money: 0,
      secretKeySet: false,
      tokenType: '',
      userId: '',
      username: '',
      isMerchant: false,
    );
  }

  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    exp = json['exp'];
    iat = json['iat'];
    jti = json['jti'];
    userId = json['user_id'];
    email = json['email'];
    username = json['username'];
    money = json['money'];
    id = json['id'];
    emailVerfication = json['email_verfication'];
    secretKeySet = json['secret_key_set'];
    isMerchant = json['is_merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_type'] = tokenType;
    data['exp'] = exp;
    data['iat'] = iat;
    data['jti'] = jti;
    data['user_id'] = userId;
    data['email'] = email;
    data['username'] = username;
    data['money'] = money;
    data['id'] = id;
    data['email_verfication'] = emailVerfication;
    data['secret_key_set'] = secretKeySet;
    data['is_merchant'] = isMerchant;
    return data;
  }
}
