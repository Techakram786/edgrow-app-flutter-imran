

class JobPrefModel {
  var id;
  String? jobName;

  JobPrefModel({this.id, this.jobName});

  JobPrefModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobName = json['job_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_name'] = jobName;
    return data;
  }
}