class TopCourses {
  int? id;
  String? courseTitle;
  String? courseImage;
  String? description;
  String? sellingPrice;
  String? tagName;
  String? rating;
  String? ratingCount;
  bool? saveStatus;

  TopCourses(
      {this.id,
        this.courseTitle,
        this.courseImage,
        this.description,
        this.sellingPrice,
        this.tagName,
        this.rating,
        this.ratingCount,
        this.saveStatus});

  TopCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseTitle = json['course_title'];
    courseImage = json['course_image'];
    description = json['description'];
    sellingPrice = json['selling_price'];
    tagName = json['tag_name'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    saveStatus = json['save_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_title'] = courseTitle;
    data['course_image'] = courseImage;
    data['description'] = description;
    data['selling_price'] = sellingPrice;
    data['tag_name'] = tagName;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['save_status'] = saveStatus;
    return data;
  }
}