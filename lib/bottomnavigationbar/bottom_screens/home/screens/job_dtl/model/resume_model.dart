import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/resume_data.dart';

class ResumeModel {
  String? resumeStaticContent;
  List<ResumesData>? resumes;

  ResumeModel({this.resumeStaticContent, this.resumes});

  ResumeModel.fromJson(Map<String, dynamic> json) {
    resumeStaticContent = json['resume_static_content'];
    if (json['resumes'] != null) {
      resumes = <ResumesData>[];
      json['resumes'].forEach((v) {
        resumes!.add(ResumesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resume_static_content'] = resumeStaticContent;
    if (resumes != null) {
      data['resumes'] = resumes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}