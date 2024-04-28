class WorkExpModel {
  int? id;
  String? title;
  String? companyName;
  int? salary;
  String? level;
  String? startYear;
  String? endYear;
  int? currentlyWorking;

  WorkExpModel(
      {this.id,
        this.title,
        this.companyName,
        this.salary,
        this.level,
        this.startYear,
        this.endYear,
        this.currentlyWorking});

  WorkExpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    companyName = json['company_name'];
    salary = json['salary'];
    level = json['level'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    currentlyWorking = json['currently_working'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['company_name'] = companyName;
    data['salary'] = salary;
    data['level'] = level;
    data['start_year'] = startYear;
    data['end_year'] = endYear;
    data['currently_working'] = currentlyWorking;
    return data;
  }
}