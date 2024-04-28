class CollegeDtlModel {
  int? id;
  String? instituteName;
  String? instituteLogo;
  String? countryName;
  String? cityName;
  String? industryType;
  bool? saveStatus;
  int? jobCount;
  CollegeDtlModel(
      {this.id,
        this.instituteName,
        this.instituteLogo,
        this.countryName,
        this.cityName,
        this.saveStatus,
        this.jobCount,
        this.industryType});

  CollegeDtlModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteName = json['institute_name'];
    instituteLogo = json['institute_logo'];
    countryName = json['country_name'];
    cityName = json['city_name'];
    industryType = json['industry_type'];
    saveStatus = json['save_status'];
    jobCount = json['jobs_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_name'] = instituteName;
    data['institute_logo'] = instituteLogo;
    data['country_name'] = countryName;
    data['city_name'] = cityName;
    data['industry_type'] = industryType;
    data['save_status'] = saveStatus;
    data['jobs_count'] = jobCount;
    return data;
  }
}