



import 'Colleges.dart';
import 'jobs.dart';
import 'top_banner.dart';
import 'top_courses.dart';
import 'trending_jobs.dart';
import 'banner.dart';

class HomeDataModel {
  String? name;
  String? profilePicture;
  int? isLookingForJob;
  num? profileCompletionPercentage;
  int? profileViewed;
  int? jobsSeen;
  int? jobsApplied;
  int? interviewScheduled;
  int? interviewRejected;
  int? interviewShortlisted;
  TopBanner? topBanner;
  TopBanner? middleBanner;
  TopBanner? bottomBanner;
  List<TrendingJobs>? trendingJobs;
  List<Colleges>? colleges;
  List<TopCourses>? topCourses;
  List<TopBanner>? listBottomBanners;
  List<Banners>? banners;
  List<Jobs>? jobs;

  HomeDataModel(
      {this.name,
        this.profilePicture,
        this.isLookingForJob,
        this.profileCompletionPercentage,
        this.profileViewed,
        this.jobsSeen,
        this.jobsApplied,
        this.interviewScheduled,
        this.interviewRejected,
        this.interviewShortlisted,
        this.topBanner,
        this.colleges,
        this.middleBanner,
        this.bottomBanner,
        this.trendingJobs,
        this.banners,
        this.jobs,
        this.topCourses,
        this.listBottomBanners});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    isLookingForJob = json['is_looking_for_job'];
    profileCompletionPercentage = json['profile_completion_percentage'];
    profileViewed = json['profile_viewed'];
    jobsSeen = json['jobs_seen'];
    jobsApplied = json['jobs_applied'];
    interviewScheduled = json['interview_scheduled'];
    interviewRejected = json['interview_rejected'];
    interviewShortlisted = json['interview_shortlisted'];
    topBanner = json['top_banner'] != null
        ? TopBanner.fromJson(json['top_banner'])
        : null;
    middleBanner = json['middle_banner'] != null
        ? TopBanner.fromJson(json['middle_banner'])
        : null;
    if (json['trending_jobs'] != null) {
      trendingJobs = <TrendingJobs>[];
      json['trending_jobs'].forEach((v) {
        trendingJobs!.add(TrendingJobs.fromJson(v));
      });
    }
    if (json['colleges'] != null) {
      colleges = <Colleges>[];
      json['colleges'].forEach((v) {
        colleges!.add(Colleges.fromJson(v));
      });
    }
    if (json['top_courses'] != null) {
      topCourses = <TopCourses>[];
      json['top_courses'].forEach((v) {
        topCourses!.add(TopCourses.fromJson(v));
      });
    }
    if (json['bottom_banners'] != null) {
      listBottomBanners = <TopBanner>[];
      json['bottom_banners'].forEach((v) {
        listBottomBanners!.add(TopBanner.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(Jobs.fromJson(v));
      });
    }
    var bData = json['bottom_banner'] != null
        ? TopBanner.fromJson(json['bottom_banner'])
        : null;
    if(bData!=null){
      bottomBanner=bData;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    data['is_looking_for_job'] = isLookingForJob;
    data['profile_completion_percentage'] = profileCompletionPercentage;
    data['profile_viewed'] = profileViewed;
    data['jobs_seen'] = jobsSeen;
    data['jobs_applied'] = jobsApplied;
    data['interview_scheduled'] = interviewScheduled;
    data['interview_rejected'] = interviewRejected;
    data['interview_shortlisted'] = interviewShortlisted;
    if (topBanner != null) {
      data['top_banner'] = topBanner!.toJson();
    }
    if (middleBanner != null) {
      data['middle_banner'] = middleBanner!.toJson();
    }
    if (trendingJobs != null) {
      data['trending_jobs'] =
          trendingJobs!.map((v) => v.toJson()).toList();
    }
    if (colleges != null) {
      data['colleges'] = colleges!.map((v) => v.toJson()).toList();
    }
    if (topCourses != null) {
      data['top_courses'] = topCourses!.map((v) => v.toJson()).toList();
    }
    if (listBottomBanners != null) {
      data['bottom_banners'] =
          listBottomBanners!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    if (bottomBanner != null) {
      data['bottom_banner'] = bottomBanner!.toJson();
    }
    return data;
  }
}