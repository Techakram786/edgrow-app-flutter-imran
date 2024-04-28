class LanguageModel {
  int? id;
  String? language;

  LanguageModel({this.id, this.language});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language'] = language;
    return data;
  }
}