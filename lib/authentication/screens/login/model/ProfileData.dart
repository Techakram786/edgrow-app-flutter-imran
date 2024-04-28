class ProfileData {
  int? contactInfo;
  int? educationDetails;
  int? keySkills;
  int? jobPreferences;
  int? preferredLocation;
  int? expectedSalary;
  int? resume;

  ProfileData(
      {this.contactInfo,
        this.educationDetails,
        this.keySkills,
        this.jobPreferences,
        this.preferredLocation,
        this.expectedSalary,
        this.resume});

  ProfileData.fromJson(Map<String, dynamic> json) {
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