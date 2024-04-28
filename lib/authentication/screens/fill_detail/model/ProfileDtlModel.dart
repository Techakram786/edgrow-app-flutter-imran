class ProfileDtlModel {
  int? contactInfo=0;
  int? educationDetails=0;
  int? keySkills=0;
  int? jobPreferences=0;
  int? preferredLocation=0;
  int? expectedSalary=0;
  int? resume=0;

  ProfileDtlModel(
      {this.contactInfo,
        this.educationDetails,
        this.keySkills,
        this.jobPreferences,
        this.preferredLocation,
        this.expectedSalary,
        this.resume});

  ProfileDtlModel.fromJson(Map<String, dynamic> json) {
    contactInfo = json['contact_info'];
    educationDetails = json['education_details'];
    keySkills = json['key_skills'];
    jobPreferences = json['job_preferences'];
    preferredLocation = json['preferred_location'];
    expectedSalary = json['expected_salary'];
    resume = json['resume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_info'] = contactInfo;
    data['education_details'] = educationDetails;
    data['key_skills'] = keySkills;
    data['job_preferences'] = jobPreferences;
    data['preferred_location'] = preferredLocation;
    data['expected_salary'] = expectedSalary;
    data['resume'] = resume;
    return data;
  }
}