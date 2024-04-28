class SkillDtlModel {
  int? skillsId;
  List<String>? skillNames;

  SkillDtlModel({this.skillsId, this.skillNames});

  SkillDtlModel.fromJson(Map<String, dynamic> json) {
    skillsId = json['skills_id'];
    skillNames = json['skill_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skills_id'] = skillsId;
    data['skill_names'] = skillNames;
    return data;
  }
}