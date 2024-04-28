class CoursesData {
  int? id;
  String? tagName;
  String? courseImage;
  String? courseTitle;
  String? actualPrice;
  String? sellingPrice;
  String? rating;
  String? ratingCount;
  bool? saveStatus;

  CoursesData(
      {this.id,
        this.tagName,
        this.courseImage,
        this.courseTitle,
        this.actualPrice,
        this.sellingPrice,
        this.rating,
        this.ratingCount,
        this.saveStatus,
      });

  CoursesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tag_name'];
    courseImage = json['course_image'];
    courseTitle = json['course_title'];
    actualPrice = json['actual_price'];
    sellingPrice = json['selling_price'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    saveStatus = json['save_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag_name'] = tagName;
    data['course_image'] = courseImage;
    data['course_title'] = courseTitle;
    data['actual_price'] = actualPrice;
    data['selling_price'] = sellingPrice;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['save_status'] = saveStatus;
    return data;
  }
}