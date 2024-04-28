import 'StatusModel.dart';

class TimeLine {
  StatusModel? applied;
  StatusModel? sent;
  StatusModel? viewed;
  StatusModel? shortlisted;
  StatusModel? secondRoundSubmitted;
  StatusModel? interviewScheduled;
  StatusModel? rejected;
  StatusModel? hired;

  TimeLine(
      {this.applied,
        this.sent,
        this.viewed,
        this.shortlisted,
        this.interviewScheduled,
        this.rejected,
        this.hired});

  TimeLine.fromJson(Map<String, dynamic> json) {
    applied =
    json['Applied'] != null ? StatusModel.fromJson(json['Applied']) : null;
    sent = json['Sent'] != null ? StatusModel.fromJson(json['Sent']) : null;
    viewed =
    json['Viewed'] != null ? StatusModel.fromJson(json['Viewed']) : null;
    shortlisted = json['Shortlisted'] != null
        ? StatusModel.fromJson(json['Shortlisted'])
        : null;
    secondRoundSubmitted = json['Second Round Submitted'] != null
        ? StatusModel.fromJson(json['Second Round Submitted'])
        : null;
    interviewScheduled = json['Interview Scheduled'] != null
        ? StatusModel.fromJson(json['Interview Scheduled'])
        : null;
    rejected = json['Rejected'] != null
        ? StatusModel.fromJson(json['Rejected'])
        : null;
    hired = json['Hired'] != null ? StatusModel.fromJson(json['Hired']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (applied != null) {
      data['Applied'] = applied!.toJson();
    }
    if (sent != null) {
      data['Sent'] = sent!.toJson();
    }
    if (viewed != null) {
      data['Viewed'] = viewed!.toJson();
    }
    if (shortlisted != null) {
      data['Shortlisted'] = shortlisted!.toJson();
    }
    if (secondRoundSubmitted != null) {
      data['Second Round Submitted'] = secondRoundSubmitted!.toJson();
    }
    if (interviewScheduled != null) {
      data['Interview Scheduled'] = interviewScheduled!.toJson();
    }
    if (rejected != null) {
      data['Rejected'] = rejected!.toJson();
    }
    if (hired != null) {
      data['Hired'] = hired!.toJson();
    }
    return data;
  }
}