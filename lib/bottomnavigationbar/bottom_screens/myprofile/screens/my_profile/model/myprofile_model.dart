class MyProfileModel {
  String? name;
  String? profilePicture;
  String? currentPosition;
  String? country;
  String? city;
  int? profileCompletionPercentage;
  int? jobsApplied;
  int? interviewShortlisted;
  int? coursesSubscribed;

  MyProfileModel({this.name,
    this.profilePicture,
    this.currentPosition,
    this.country,
    this.city,
    this.profileCompletionPercentage,
    this.jobsApplied,
    this.interviewShortlisted,
    this.coursesSubscribed});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    currentPosition = json['current_position'];
    country = json['country'];
    city = json['city'];
    profileCompletionPercentage = json['profile_completion_percentage'];
    jobsApplied = json['jobs_applied'];
    interviewShortlisted = json['interview_shortlisted'];
    coursesSubscribed = json['courses_subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    data['current_position'] = currentPosition;
    data['country'] = country;
    data['city'] = city;
    data['profile_completion_percentage'] = profileCompletionPercentage;
    data['jobs_applied'] = jobsApplied;
    data['interview_shortlisted'] = interviewShortlisted;
    data['courses_subscribed'] = coursesSubscribed;
    return data;
  }
}