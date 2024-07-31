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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['id'] = this.id;
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
