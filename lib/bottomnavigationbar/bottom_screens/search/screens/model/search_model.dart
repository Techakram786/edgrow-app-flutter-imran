import 'jobs.dart';


class SearchModel {
  int? jobsCount;
  Jobs? jobs;
  int? companiesCount;
  Jobs? companies;

  SearchModel({this.jobsCount, this.jobs, this.companiesCount, this.companies});

  SearchModel.fromJson(Map<String, dynamic> json) {
    jobsCount = json['jobs_count'];
    jobs = json['jobs'] != null ? Jobs.fromJson(json['jobs']) : null;
    companiesCount = json['companies_count'];
    companies =
    json['companies'] != null ? Jobs.fromJson(json['companies']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobs_count'] = jobsCount;
    if (jobs != null) {
      data['jobs'] = jobs!.toJson();
    }
    data['companies_count'] = companiesCount;
    if (companies != null) {
      data['companies'] = companies!.toJson();
    }
    return data;
  }
}