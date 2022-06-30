class RiskModel {
  Data? data;

  RiskModel({this.data});

  RiskModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? date;
  Results? results;

  Data({this.date, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  double? fiveYearAbs;
  double? fiveYearAve;
  double? lifetimeAbs;
  double? lifetimeAve;

  Results(
      {this.fiveYearAbs, this.fiveYearAve, this.lifetimeAbs, this.lifetimeAve});

  Results.fromJson(Map<String, dynamic> json) {
    fiveYearAbs = json['five_year_abs'];
    fiveYearAve = json['five_year_ave'];
    lifetimeAbs = json['lifetime_abs'];
    lifetimeAve = json['lifetime_ave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['five_year_abs'] = this.fiveYearAbs;
    data['five_year_ave'] = this.fiveYearAve;
    data['lifetime_abs'] = this.lifetimeAbs;
    data['lifetime_ave'] = this.lifetimeAve;
    return data;
  }
}
