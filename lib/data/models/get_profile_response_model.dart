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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['exp'] = this.exp;
    data['iat'] = this.iat;
    data['jti'] = this.jti;
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['money'] = this.money;
    data['id'] = this.id;
    data['email_verfication'] = this.emailVerfication;
    data['secret_key_set'] = this.secretKeySet;
    return data;
  }
}
