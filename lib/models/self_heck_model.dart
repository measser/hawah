class SelfCheckModel {
  bool? status;
  Data? data;

  SelfCheckModel({this.status, this.data});

  SelfCheckModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

 
}

class Data {
  List<Question>? question;

  Data({this.question});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add( Question.fromJson(v));
      });
    }
  }


}

class Question {
  int? id;
  String? question;
  String? answer;

  Question({this.id, this.question, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }


}
