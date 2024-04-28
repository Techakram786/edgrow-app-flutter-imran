class CoursesCatModel {
  int? id;
  String? categoryName;

  CoursesCatModel({this.id, this.categoryName});

  CoursesCatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    return data;
  }
}