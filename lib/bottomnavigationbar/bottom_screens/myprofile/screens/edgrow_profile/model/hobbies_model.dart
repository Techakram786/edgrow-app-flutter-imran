class HobbiesModel {
  int? hobbiesId;
  List<String>? hobbiesNames;

  HobbiesModel({this.hobbiesId, this.hobbiesNames});

  HobbiesModel.fromJson(Map<String, dynamic> json) {
    hobbiesId = json['hobbies_id'];
    hobbiesNames = json['hobbies_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hobbies_id'] = hobbiesId;
    data['hobbies_names'] = hobbiesNames;
    return data;
  }
}