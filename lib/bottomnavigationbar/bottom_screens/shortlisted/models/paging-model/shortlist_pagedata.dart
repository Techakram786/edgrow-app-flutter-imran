class ShortListPagData {
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
  String? countryName;
  String? cityName;
  String? tagName;
  String? courseImage;
  String? courseTitle;
  String? actualPrice;
  String? sellingPrice;
  String? rating;
  String? ratingCount;
  ShortListPagData(
      {this.id,
        this.instituteLogo,
        this.instituteName,
        this.jobTitle,
        this.location,
        this.jobType,
        this.minExperience,
        this.maxExperience,
        this.postedOn,
        this.itemType,
        this.countryName,
        this.cityName,
        this.tagName,
        this.courseImage,
        this.courseTitle,
        this.actualPrice,
        this.sellingPrice,
        this.rating,
        this.ratingCount
      });

  ShortListPagData.fromJson(Map<String, dynamic> json) {
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
    countryName = json['country_name'];
    cityName = json['city_name'];
    tagName = json['tag_name'];
    courseImage = json['course_image'];
    courseTitle = json['course_title'];
    actualPrice = json['actual_price'];
    sellingPrice = json['selling_price'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
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
    data['country_name'] = countryName;
    data['city_name'] = cityName;
    data['tag_name'] = tagName;
    data['course_image'] = courseImage;
    data['course_title'] = courseTitle;
    data['actual_price'] = actualPrice;
    data['selling_price'] = sellingPrice;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    return data;
  }
}