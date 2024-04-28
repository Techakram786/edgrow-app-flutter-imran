class Data {
  int? id;
  String? createdAt;
  String? jobTitle;
  String? location;
  String? minExperience;
  String? maxExperience;
  String? instituteLogo;
  String? jobType;
  String? postedOn;
  bool? saveStatus;

  Data(
      {this.id,
        this.createdAt,
        this.jobTitle,
        this.location,
        this.minExperience,
        this.maxExperience,
        this.instituteLogo,
        this.jobType,
        this.postedOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    jobTitle = json['job_title'];
    location = json['location'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    instituteLogo = json['institute_logo'];
    jobType = json['job_type'];
    postedOn = json['posted_on'];
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
    data['institute_logo'] = instituteLogo;
    data['job_type'] = jobType;
    data['posted_on'] = postedOn;
    data['save_status'] = saveStatus;
    return data;
  }
}