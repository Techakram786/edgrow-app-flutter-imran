class EduDtlModel {
  int? id;
  String? highestQualification;
  String? course;
  String? courseType;
  String? specialization;
  String? universityName;
  String? marks;
  int? startYear;
  int? endYear;
  int? currentlyStudying;

  EduDtlModel(
      {this.id,
        this.highestQualification,
        this.course,
        this.courseType,
        this.specialization,
        this.universityName,
        this.marks,
        this.startYear,
        this.endYear,
        this.currentlyStudying});

  EduDtlModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    highestQualification = json['highest_qualification'];
    course = json['course'];
    courseType = json['course_type'];
    specialization = json['specialization'];
    universityName = json['university_name'];
    marks = json['marks'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    currentlyStudying = json['currently_studying'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['highest_qualification'] = highestQualification;
    data['course'] = course;
    data['course_type'] = courseType;
    data['specialization'] = specialization;
    data['university_name'] = universityName;
    data['marks'] = marks;
    data['start_year'] = startYear;
    data['end_year'] = endYear;
    data['currently_studying'] = currentlyStudying;
    return data;
  }
}