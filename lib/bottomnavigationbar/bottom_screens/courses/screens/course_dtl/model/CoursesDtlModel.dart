import 'CurriculumModel.dart';

class CoursesDtlModel {
  int? id;
  String? courseImage;
  String? courseTitle;
  String? tagName;
  String? description;
  String? actualPrice;
  String? sellingPrice;
  String? rating;
  String? ratingCount;
  List<String>? courseIncludes;
  int? sectionsCount;
  int? classesCount;
  String? classesLength;
  List<CurriculumModel>? sections;

  CoursesDtlModel(
      {this.id,
        this.courseImage,
        this.courseTitle,
        this.tagName,
        this.description,
        this.actualPrice,
        this.sellingPrice,
        this.rating,
        this.ratingCount,
        this.courseIncludes,
        this.sectionsCount,
        this.classesCount,
        this.classesLength,
        this.sections});

  CoursesDtlModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseImage = json['course_image'];
    courseTitle = json['course_title'];
    tagName = json['tag_name'];
    description = json['description'];
    actualPrice = json['actual_price'];
    sellingPrice = json['selling_price'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    courseIncludes = json['course_includes'].cast<String>();
    sectionsCount = json['sections_count'];
    classesCount = json['classes_count'];
    classesLength = json['classes_length'];
    if (json['sections'] != null) {
      sections = <CurriculumModel>[];
      json['sections'].forEach((v) {
        sections!.add(CurriculumModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_image'] = courseImage;
    data['course_title'] = courseTitle;
    data['tag_name'] = tagName;
    data['description'] = description;
    data['actual_price'] = actualPrice;
    data['selling_price'] = sellingPrice;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['course_includes'] = courseIncludes;
    data['sections_count'] = sectionsCount;
    data['classes_count'] = classesCount;
    data['classes_length'] = classesLength;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}