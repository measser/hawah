class RegisterModel {
  bool? status;
  String? message;
  UserData? userData;

  RegisterModel({this.status, this.message, this.userData});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? email;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? phone;

  UserData(
      {this.email, this.firstName, this.lastName, this.birthdate, this.phone});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birthdate'] = this.birthdate;
    data['phone'] = this.phone;
    return data;
  }
}
