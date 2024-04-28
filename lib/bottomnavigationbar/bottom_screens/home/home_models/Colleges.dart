class Colleges {
  int? id;
  String? instituteName;
  String? instituteLogo;
  int? jobsCount;

  Colleges({this.id, this.instituteName, this.instituteLogo, this.jobsCount});

  Colleges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteName = json['institute_name'];
    instituteLogo = json['institute_logo'];
    jobsCount = json['jobs_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_name'] = instituteName;
    data['institute_logo'] = instituteLogo;
    data['jobs_count'] = jobsCount;
    return data;
  }
}