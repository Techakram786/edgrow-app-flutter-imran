class RecruiterDetails {
  String? recruiterName;
  String? recruiterPosition;

  RecruiterDetails({this.recruiterName, this.recruiterPosition});

  RecruiterDetails.fromJson(Map<String, dynamic> json) {
    recruiterName = json['recruiter_name'];
    recruiterPosition = json['recruiter_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recruiter_name'] = recruiterName;
    data['recruiter_position'] = recruiterPosition;
    return data;
  }
}