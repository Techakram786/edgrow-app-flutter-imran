class JobData {
  int? id;
  String? instituteLogo;
  String? instituteName;
  String? jobTitle;
  String? location;
  String? jobType;
  String? minExperience;
  String? maxExperience;
  String? postedOn;
  String? itemType;

  JobData(
      {this.id,
        this.instituteLogo,
        this.instituteName,
        this.jobTitle,
        this.location,
        this.jobType,
        this.minExperience,
        this.maxExperience,
        this.postedOn,
        this.itemType});

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteLogo = json['institute_logo'];
    instituteName = json['institute_name'];
    jobTitle = json['job_title'];
    location = json['location'];
    jobType = json['job_type'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    postedOn = json['posted_on'];
    itemType = json['item_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_logo'] = instituteLogo;
    data['institute_name'] = instituteName;
    data['job_title'] = jobTitle;
    data['location'] = location;
    data['job_type'] = jobType;
    data['min_experience'] = minExperience;
    data['max_experience'] = maxExperience;
    data['posted_on'] = postedOn;
    data['item_type'] = itemType;
    return data;
  }
}