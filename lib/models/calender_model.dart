class CalenderModel {
  bool? status;
  int? period;
  Date? date;

  CalenderModel({this.status, this.period, this.date});

  CalenderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    period = json['period'];
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['period'] = this.period;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    return data;
  }
}

class Date {
  List<Dates>? dates;

  Date({this.dates});

  Date.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  int? id;
  int? m;
  int? y;
  String? title;
  bool? isCheck;

  Dates({this.id, this.m, this.y, this.title, this.isCheck});

  Dates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    m = json['M'];
    y = json['Y'];
    title = json['title'];
    isCheck = json['is_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['M'] = this.m;
    data['Y'] = this.y;
    data['title'] = this.title;
    data['is_check'] = this.isCheck;
    return data;
  }
}
