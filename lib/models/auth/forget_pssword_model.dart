class ForgetModel {
  bool? status;
  String? messege;

  ForgetModel({this.status, this.messege});

  ForgetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['messege'] = this.messege;
    return data;
  }
}
