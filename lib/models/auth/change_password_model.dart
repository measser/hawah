class ChangePasswordModel {
  String? success;
  bool?  status;
  String?  messege;

  ChangePasswordModel({this.success});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['messege'] = this.messege;
    return data;
  }
}
