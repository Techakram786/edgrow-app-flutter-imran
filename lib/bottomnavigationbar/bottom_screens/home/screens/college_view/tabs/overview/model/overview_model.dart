class OverviewModel {
  int? id;
  String? cityName;
  String? countryName;
  String? instituteName;
  String? industryType;
  String? website;
  String? people;
  String? instituteDescription;
  List<String>? collegeImages;
  List<String>? allCollegeImages;

  OverviewModel(
      {this.id,
        this.cityName,
        this.countryName,
        this.instituteName,
        this.industryType,
        this.website,
        this.people,
        this.instituteDescription,
        this.collegeImages,
        this.allCollegeImages,
      });

  OverviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['city_name'];
    countryName = json['country_name'];
    instituteName = json['institute_name'];
    industryType = json['industry_type'];
    website = json['website'];
    people = json['people'];
    instituteDescription = json['institute_description'];
    collegeImages = json['college_images'].cast<String>();
    allCollegeImages = json['all_college_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_name'] = cityName;
    data['country_name'] = countryName;
    data['institute_name'] = instituteName;
    data['industry_type'] = industryType;
    data['website'] = website;
    data['people'] = people;
    data['institute_description'] = instituteDescription;
    data['college_images'] = collegeImages;
    data['all_college_images'] = allCollegeImages;
    return data;
  }
}