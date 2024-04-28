class CompanyData {
  int? id;
  String? instituteName;
  String? instituteLogo;
  String? countryName;
  String? cityName;
  String? itemType;

  CompanyData(
      {this.id,
        this.instituteName,
        this.instituteLogo,
        this.countryName,
        this.cityName,
        this.itemType});

  CompanyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instituteName = json['institute_name'];
    instituteLogo = json['institute_logo'];
    countryName = json['country_name'];
    cityName = json['city_name'];
    itemType = json['item_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_name'] = instituteName;
    data['institute_logo'] = instituteLogo;
    data['country_name'] = countryName;
    data['city_name'] = cityName;
    data['item_type'] = itemType;
    return data;
  }
}