class Institute {
  int? id;
  String? instituteLogo;
  String? instituteName;

  Institute({this.id, this.instituteLogo});

  Institute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteLogo = json['institute_logo'];
    instituteName = json['institute_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_logo'] = instituteLogo;
    data['institute_name'] = instituteName;
    return data;
  }
}