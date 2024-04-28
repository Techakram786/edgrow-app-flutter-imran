class ReviewOrderModel {
  int? id;
  String? courseImage;
  String? courseTitle;
  String? tagName;
  String? description;
  String? subTotal;
  String? grandTotal;
  String? rating;
  String? ratingCount;
  int? discount;

  ReviewOrderModel(
      {this.id,
        this.courseImage,
        this.courseTitle,
        this.tagName,
        this.description,
        this.subTotal,
        this.grandTotal,
        this.rating,
        this.ratingCount,
        this.discount});

  ReviewOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseImage = json['course_image'];
    courseTitle = json['course_title'];
    tagName = json['tag_name'];
    description = json['description'];
    subTotal = json['sub_total'];
    grandTotal = json['grand_total'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_image'] = courseImage;
    data['course_title'] = courseTitle;
    data['tag_name'] = tagName;
    data['description'] = description;
    data['sub_total'] = subTotal;
    data['grand_total'] = grandTotal;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['discount'] = discount;
    return data;
  }
}