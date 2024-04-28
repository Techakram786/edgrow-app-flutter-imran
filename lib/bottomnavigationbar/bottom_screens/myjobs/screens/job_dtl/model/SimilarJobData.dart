class SimilarJobs {
  int? id;
  String? createdAt;
  String? jobTitle;
  String? location;
  String? minExperience;
  String? maxExperience;
  int? instituteId;
  String? jobType;
  String? postedOn;
  String? instituteLogo;
  String? instituteName;
  bool? saveStatus;
  SimilarJobs(
      {this.id,
        this.createdAt,
        this.jobTitle,
        this.location,
        this.minExperience,
        this.maxExperience,
        this.instituteId,
        this.jobType,
        this.postedOn,
        this.instituteLogo,
        this.instituteName,
        this.saveStatus,});

  SimilarJobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    jobTitle = json['job_title'];
    location = json['location'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    instituteId = json['institute_id'];
    jobType = json['job_type'];
    postedOn = json['posted_on'];
    instituteLogo = json['institute_logo'];
    instituteName = json['institute_name'];
    saveStatus = json['save_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['job_title'] = jobTitle;
    data['location'] = location;
    data['min_experience'] = minExperience;
    data['max_experience'] = maxExperience;
    data['institute_id'] = instituteId;
    data['job_type'] = jobType;
    data['posted_on'] = postedOn;
    data['institute_logo'] = instituteLogo;
    data['institute_name'] = instituteName;
    data['save_status'] = saveStatus;
    return data;
  }
}