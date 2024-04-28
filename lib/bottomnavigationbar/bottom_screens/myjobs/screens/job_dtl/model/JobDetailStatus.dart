import 'SimilarJobData.dart';
import 'TimeLineModel.dart';

class JobApplDtl {
  int? id;
  int? jobOpportunityId;
  String? instituteLogo;
  String? instituteName;
  String? industryType;
  String? jobTitle;
  String? location;
  String? jobType;
  String? minExperience;
  String? maxExperience;
  String? minSalary;
  String? maxSalary;
  String? applicationStatus;
  String? createdAt;
  String? postedOn;
  TimeLine? timeLine;
  List<SimilarJobs>? similarJobs;
  bool? saveStatus;

  JobApplDtl(
      {this.id,
        this.jobOpportunityId,
        this.instituteLogo,
        this.instituteName,
        this.industryType,
        this.jobTitle,
        this.location,
        this.jobType,
        this.minExperience,
        this.maxExperience,
        this.minSalary,
        this.maxSalary,
        this.applicationStatus,
        this.createdAt,
        this.postedOn,
        this.timeLine,
        this.similarJobs,
        this.saveStatus,
      });


  JobApplDtl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobOpportunityId = json['job_opportunity_id'];
    instituteLogo = json['institute_logo'];
    instituteName = json['institute_name'];
    industryType = json['industry_type'];
    jobTitle = json['job_title'];
    location = json['location'];
    jobType = json['job_type'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    minSalary = json['min_salary'];
    maxSalary = json['max_salary'];
    applicationStatus = json['application_status'];
    createdAt = json['created_at'];
    postedOn = json['posted_on'];
    saveStatus = json['save_status'];
    timeLine = json['time_line'] != null
        ? TimeLine.fromJson(json['time_line'])
        : null;
    if (json['similar_jobs'] != null) {
      similarJobs = <SimilarJobs>[];
      json['similar_jobs'].forEach((v) {
        similarJobs!.add(SimilarJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_opportunity_id'] = jobOpportunityId;
    data['institute_logo'] = instituteLogo;
    data['institute_name'] = instituteName;
    data['industry_type'] = industryType;
    data['job_title'] = jobTitle;
    data['location'] = location;
    data['job_type'] = jobType;
    data['min_experience'] = minExperience;
    data['max_experience'] = maxExperience;
    data['min_salary'] = minSalary;
    data['max_salary'] = maxSalary;
    data['application_status'] = applicationStatus;
    data['created_at'] = createdAt;
    data['posted_on'] = postedOn;
    data['save_status'] = saveStatus;
    if (timeLine != null) {
      data['time_line'] = timeLine!.toJson();
    }
    if (similarJobs != null) {
      data['similar_jobs'] = similarJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}