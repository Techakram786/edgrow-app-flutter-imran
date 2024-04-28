import 'recruiter_details.dart';

class JobDetailsModel {
  int? id;
  String? createdAt;
  String? jobTitle;
  String? location;
  String? minExperience;
  String? maxExperience;
  String? instituteName;
  String? instituteLogo;
  String? jobType;
  String? industryType;
  String? minSalary;
  String? maxSalary;
  String? noOfOpenings;
  List<String>? educationQualification;
  int? isSalaryHide;
  String? postedOn;
  String? responsibilities;
  String? qualifications;
  String? benefits;
  RecruiterDetails? recruiterDetails;
  List<String>? keySkills;
  num? skillsPercentage;
  int? experiencePercentage;
  int? salaryPercentage;
  num? overallPercentage;
  bool? saveStatus;
  String? salaryType;
  JobDetailsModel(
      {this.id,
        this.createdAt,
        this.jobTitle,
        this.location,
        this.minExperience,
        this.maxExperience,
        this.instituteName,
        this.instituteLogo,
        this.jobType,
        this.industryType,
        this.minSalary,
        this.maxSalary,
        this.noOfOpenings,
        this.educationQualification,
        this.isSalaryHide,
        this.postedOn,
        this.responsibilities,
        this.qualifications,
        this.benefits,
        this.recruiterDetails,
        this.keySkills,
        this.skillsPercentage,
        this.experiencePercentage,
        this.salaryPercentage,
        this.overallPercentage,
        this.saveStatus,
        this.salaryType,
      });

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    jobTitle = json['job_title'];
    location = json['location'];
    minExperience = json['min_experience'];
    maxExperience = json['max_experience'];
    instituteName = json['institute_name'];
    instituteLogo = json['institute_logo'];
    jobType = json['job_type'];
    industryType = json['industry_type'];
    minSalary = json['min_salary'];
    maxSalary = json['max_salary'];
    noOfOpenings = json['no_of_openings'];
    educationQualification = json['education_qualification'].cast<String>();
    isSalaryHide = json['is_salary_hide'];
    postedOn = json['posted_on'];
    responsibilities = json['responsibilities'];
    qualifications = json['qualifications'];
    benefits = json['benefits'];
    recruiterDetails = json['recruiter_details'] != null
        ? RecruiterDetails.fromJson(json['recruiter_details'])
        : null;
    keySkills = json['key_skills'].cast<String>();
    skillsPercentage = json['skills_percentage'];
    experiencePercentage = json['experience_percentage'];
    salaryPercentage = json['salary_percentage'];
    overallPercentage = json['overall_percentage'];
    saveStatus = json['save_status'];
    salaryType = json['salary_package_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['job_title'] = jobTitle;
    data['location'] = location;
    data['min_experience'] = minExperience;
    data['max_experience'] = maxExperience;
    data['institute_name'] = instituteName;
    data['institute_logo'] = instituteLogo;
    data['job_type'] = jobType;
    data['industry_type'] = industryType;
    data['min_salary'] = minSalary;
    data['max_salary'] = maxSalary;
    data['no_of_openings'] = noOfOpenings;
    data['education_qualification'] = educationQualification;
    data['is_salary_hide'] = isSalaryHide;
    data['posted_on'] = postedOn;
    data['responsibilities'] = responsibilities;
    data['qualifications'] = qualifications;
    data['benefits'] = benefits;
    if (recruiterDetails != null) {
      data['recruiter_details'] = recruiterDetails!.toJson();
    }
    data['key_skills'] = keySkills;
    data['skills_percentage'] = skillsPercentage;
    data['experience_percentage'] = experiencePercentage;
    data['salary_percentage'] = salaryPercentage;
    data['overall_percentage'] = overallPercentage;
    data['save_status'] = saveStatus;
    data['salary_package_type'] = salaryType;
    return data;
  }
}