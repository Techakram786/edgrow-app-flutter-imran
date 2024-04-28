class JobCriteriaModel {
  List<String>? jobLookingFor;
  List<String>? typeOfWork;
  List<String>? location;
  String? level;
  String? expectedSalary;

  JobCriteriaModel(
      {this.jobLookingFor,
        this.typeOfWork,
        this.location,
        this.level,
        this.expectedSalary});

  JobCriteriaModel.fromJson(Map<String, dynamic> json) {
    jobLookingFor = json['job_looking_for'].cast<String>();
    typeOfWork = json['type_of_work'].cast<String>();
    location = json['location'].cast<String>();
    level = json['level'];
    expectedSalary = json['expected_salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_looking_for'] = jobLookingFor;
    data['type_of_work'] = typeOfWork;
    data['location'] = location;
    data['level'] = level;
    data['expected_salary'] = expectedSalary;
    return data;
  }
}