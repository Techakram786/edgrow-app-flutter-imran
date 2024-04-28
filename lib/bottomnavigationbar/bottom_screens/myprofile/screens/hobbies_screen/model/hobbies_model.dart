class HobbiesModel {
  int? id;
  String? hobby;

  HobbiesModel({this.id, this.hobby});

  HobbiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hobby = json['hobby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hobby'] = hobby;
    return data;
  }
}