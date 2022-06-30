class ReportModel {
  bool? status;
  List<Questions>? questions;

  ReportModel({this.status, this.questions});

  ReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  bool? answer;
  SelfCheck? selfCheck;
  String? date;

  Questions({this.answer, this.selfCheck, this.date});

  Questions.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    selfCheck = json['self_check'] != null
        ? new SelfCheck.fromJson(json['self_check'])
        : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    if (this.selfCheck != null) {
      data['self_check'] = this.selfCheck!.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class SelfCheck {
  int? id;
  String? question;

  SelfCheck({this.id, this.question});

  SelfCheck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    return data;
  }
}
