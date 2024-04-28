class QuestionAnswerData {
  String? id;
  String? answer;

  QuestionAnswerData({this.id, this.answer});

  QuestionAnswerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}