class KeySkillModel {
  int? id;
  String? skillName;

  KeySkillModel({this.id, this.skillName});

  KeySkillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillName = json['skill_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['skill_name'] = skillName;
    return data;
  }
}