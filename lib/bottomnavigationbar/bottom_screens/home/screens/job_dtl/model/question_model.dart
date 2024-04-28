import 'data_question.dart';

class QuestionModel {
  String? status;
  String? message;
  List<DataQuestion>? data;

  QuestionModel({this.status, this.message, this.data});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataQuestion>[];
      json['data'].forEach((v) {
        data!.add(DataQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}