class FindUserResponseModel {
  String? email;
  String? username;
  String? id;

  FindUserResponseModel({this.email, this.username, this.id});

  FindUserResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['id'] = id;
    return data;
  }

  static FindUserResponseModel empty() {
    return FindUserResponseModel(
      email: "",
      username: "",
      id: "",
    );
  }
}
