class LanguageModel {
  int? languagesId;
  List<String>? languagesNames;

  LanguageModel({this.languagesId, this.languagesNames});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    languagesId = json['languages_id'];
    languagesNames = json['languages_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['languages_id'] = languagesId;
    data['languages_names'] = languagesNames;
    return data;
  }
}