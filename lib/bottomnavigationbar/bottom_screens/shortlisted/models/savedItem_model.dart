import '../../courses/models/CoursesData.dart';
import 'company_data.dart';
import 'job_data.dart';

class SavedItemModel {
  int? jobsCount;
  List<JobData>? jobs;
  int? companiesCount;
  List<CompanyData>? companies;
  int? coursesCount;
  List<CoursesData>? courses;

  SavedItemModel(
      {this.jobsCount,
        this.jobs,
        this.companiesCount,
        this.companies,
        this.coursesCount,
        this.courses});

  SavedItemModel.fromJson(Map<String, dynamic> json) {
    jobsCount = json['jobs_count'];
    if (json['jobs'] != null) {
      jobs = <JobData>[];
      json['jobs'].forEach((v) {
        jobs!.add(JobData.fromJson(v));
      });
    }
    companiesCount = json['companies_count'];
    if (json['companies'] != null) {
      companies = <CompanyData>[];
      json['companies'].forEach((v) {
        companies!.add(CompanyData.fromJson(v));
      });
    }
    coursesCount = json['courses_count'];
    if (json['courses'] != null) {
      courses = <CoursesData>[];
      json['courses'].forEach((v) {
        courses!.add(CoursesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobs_count'] = jobsCount;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    data['companies_count'] = companiesCount;
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    data['courses_count'] = coursesCount;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
