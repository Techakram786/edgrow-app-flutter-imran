class MyJobCountModel {
  int? appliedCount;
  int? rejectedCount;
  int? shortlistedCount;
  int? interviewScheduledCount;

  MyJobCountModel(
      {this.appliedCount,
        this.rejectedCount,
        this.shortlistedCount,
        this.interviewScheduledCount});

  MyJobCountModel.fromJson(Map<String, dynamic> json) {
    appliedCount = json['applied_count'];
    rejectedCount = json['rejected_count'];
    shortlistedCount = json['shortlisted_count'];
    interviewScheduledCount = json['interview_scheduled_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applied_count'] = appliedCount;
    data['rejected_count'] = rejectedCount;
    data['shortlisted_count'] = shortlistedCount;
    data['interview_scheduled_count'] = interviewScheduledCount;
    return data;
  }
}