class JobTypeModel {
  int? jobTypesId;
  List<String>? jobTypesNames;

  JobTypeModel({this.jobTypesId, this.jobTypesNames});

  JobTypeModel.fromJson(Map<String, dynamic> json) {
    jobTypesId = json['job_types_id'];
    jobTypesNames = json['job_types_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_types_id'] = jobTypesId;
    data['job_types_names'] = jobTypesNames;
    return data;
  }
}