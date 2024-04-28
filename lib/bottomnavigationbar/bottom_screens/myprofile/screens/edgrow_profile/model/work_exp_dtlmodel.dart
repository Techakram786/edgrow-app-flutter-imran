class WorkExpDtlModel {
  int? id;
  String? title;
  String? companyName;
  String? startYear;
  String? endYear;

  WorkExpDtlModel({this.id, this.title, this.companyName, this.startYear, this.endYear});

  WorkExpDtlModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    companyName = json['company_name'];
    startYear = json['start_year'];
    endYear = json['end_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['company_name'] = companyName;
    data['start_year'] = startYear;
    data['end_year'] = endYear;
    return data;
  }
}