class LoginModel {
  bool? status;
  String? messege;
  UserData? userData;

  LoginModel({this.status, this.messege, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['messege'] = this.messege;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? firstName;
  String? email;
  String? phone;
  Tokens? tokens;

  UserData({this.firstName, this.email, this.phone, this.tokens});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];
    tokens =
    json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    return data;
  }
}

class Tokens {
  String? refresh;
  String? access;

  Tokens({this.refresh, this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }
}
