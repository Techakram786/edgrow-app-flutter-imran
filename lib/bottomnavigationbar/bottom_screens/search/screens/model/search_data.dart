class SearchData {
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
  String? cityname;
  String? countryname;
  bool? saveStatus;
  SearchData(
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
        this.cityname,
        this.countryname,
        this.saveStatus
      });

  SearchData.fromJson(Map<String, dynamic> json) {
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
    cityname = json['city_name'];
    countryname = json['country_name'];
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
    data['city_name'] = cityname;
    data['country_name'] = countryname;
    data['save_status'] = saveStatus;
    return data;
  }
}