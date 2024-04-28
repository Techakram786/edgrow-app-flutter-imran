class JobTypeModel {
  int? id;
  String? jobType;

  JobTypeModel({this.id, this.jobType});

  JobTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobType = json['job_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_type'] = jobType;
    return data;
  }
}