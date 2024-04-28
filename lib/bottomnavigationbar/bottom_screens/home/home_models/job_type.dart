class JobType {
  int? id;
  String? jobType;

  JobType({this.id, this.jobType});

  JobType.fromJson(Map<String, dynamic> json) {
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