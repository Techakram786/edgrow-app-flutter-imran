

import 'package:dio/dio.dart' as data;

import '../../bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/question_ans_model.dart';

mixin ApiHeaders {
  static Map<String, String> startLimitAndSearch({
    required String start,
    required String limit,
    required String keyword,
  }) {
    Map<String, String> header = {
      'start': start,
      'limit': limit,
      'keyword': keyword,
    };
    return header;
  }

  static Map<String, dynamic> registerUser({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String cpassword,
    required data.MultipartFile img,
  }) {
    return {
      'full_name': name,
      'mobile_number': mobile,
      'email': email,
      'password': password,
      'password_confirmation': cpassword,
      'profile_picture': img,
    };
  }

  static Map<String, dynamic> loginUser({
    required String login,
    required String password,
    required String pushNotificationKey,
    required String deviceType,

  }) {
    return {
      'login_id': login,
      'password': password,
      'push_notification_key': pushNotificationKey,
      'device_type': deviceType,
    };
  }

  static Map<String, dynamic> profileDtl({
    required String userId,
  }) {
    return {
      'app_user_id': userId,
    };
  }

  static Map<String, dynamic> setCurrentPosition({
    required String userId,
    required String postionId,


  }) {
    return {
      'app_user_id': userId,
      'current_position_id': postionId,
    };
  }

  static Map<String, dynamic> state({
    required String countryId,
  }) {
    return {
      'country_id': countryId,
    };
  }

  static Map<String, dynamic> city({
    required String stateId,
  }) {
    return {
      'state_id': stateId,
    };
  }

  static Object contactUpdate({
    required String appId,
    required String dob,
    required String gender,
    required String countryId,
    required String stateId,
    required String cityId,
    required String address,
    required List<String> portfolio,
  }) {
    return {
      'app_user_id': appId,
      'dob': dob,
      'gender': gender,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'address': address,
      'portfolio_website': portfolio
    };
  }


  static Map<String, dynamic> addEduDtl({
    required String userId,
    required String highestQualification,
    required String course,
    required String courseType,
    required String specialization,
    required String universityName,
    required String marks,
    required String startYear,
    required String endYear,
    required String currentlyStdy,


  }) {
    return {
      'app_user_id': userId,
      'highest_qualification': highestQualification,
      'course': course,
      'course_type': courseType,
      'specialization': specialization,
      'university_name': universityName,
      'marks': marks,
      'start_year': startYear,
      'end_year': endYear,
      'currently_studying': currentlyStdy,
    };
  }

  static Object updateKeySkill({
    required String appId,
    required List<String> keySkill,
  }) {
    return {
      'app_user_id': appId,
      'skills': keySkill
    };
  }

  static Object updateJobPref({
    required String appId,
    required List<String> jobPref,
  }) {
    return {
      'app_user_id': appId,
      'job_preferences': jobPref
    };
  }

  static Object updatePrefLoc({
    required String appId,
    required List<String> loc,
  }) {
    return {
      'app_user_id': appId,
      'locations': loc
    };
  }

  static Map<String, dynamic> setExpSal({
    required String userId,
    required String startSalary,
    required String endSalary,


  }) {
    return {
      'app_user_id': userId,
      'min_salary': startSalary,
      'max_salary': endSalary,
    };
  }

  static Map<String, dynamic> uploadCv({
    required String userId,
    required String title,
    required data.MultipartFile file,
  }) {
    return {
      'app_user_id': userId,
      'title': title,
      'file': file,

    };
  }
  static Map<String, dynamic> deleteCv({
    required String resumeId,

  }) {
    return {
      'resume_id': resumeId,
    };
  }

  static Map<String, dynamic> jobStatus({
    required String jobStatus,
  }) {
    return {
      'is_looking_for_job': jobStatus,

    };
  }

  static Map<String, dynamic> jobRecommended({
    required String page,
  }) {
    return {
      'page': page,

    };
  }

  static Map<String, dynamic> collegeDtl({
    required String collegeId,
  }) {
    return {
      'college_id': collegeId,

    };
  }

  static Map<String, dynamic> collegeJobs({
    required String collegeId,
    required String page,
  }) {
    return {
      'college_id': collegeId,
      'page': page,

    };
  }

  static Map<String, dynamic> jobDtl({
    required String jobId,
  }) {
    return {
      'job_id': jobId,
    };
  }

  static Map<String, dynamic> similarJob({
    required String jobId,
    required String page,
  }) {
    return {
      'job_id': jobId,
      'page': page,
    };
  }

  static Object saveAns({
    required String jobId,
    required List<QuestionAnswerData> ans,
  }) {
    return {
      'job_id': jobId,
      'question_answer_data': ans
    };
  }

  static Map<String, dynamic> applyJob({
    required String jobId,
    required String resumeType,
    required String resumeId,
    required String coverLetter,
    required data.MultipartFile video,
  }) {
    return {
      'job_id': jobId,
      'resume_type': resumeType,
      'resume': resumeId,
      'cover_letter_description': coverLetter,
      'video': video,
    };
  }

  static Map<String, dynamic> applyJobWithFile({
    required String jobId,
    required String resumeType,
    required data.MultipartFile file,
    required String coverLetter,
    required data.MultipartFile video,
  }) {
    return {
      'job_id': jobId,
      'resume_type': resumeType,
      'resume': file,
      'cover_letter_description': coverLetter,
      'video': video,
    };
  }

  static Map<String, dynamic> myJob({
    required String page,
    required String type,
  }) {
    return {
      'page': page,
      'type': type,

    };
  }
  static Map<String, dynamic> searchMyJobs({
    required String page,
    required String type,
    required String searchWord,
  }) {
    return {
      'page': page,
      'type': type,
      'search': searchWord,
    };
  }
  static Map<String, dynamic> jobApplDtl({
    required String jobApplId,
  }) {
    return {
      'job_application_id': jobApplId,
    };
  }

  static Map<String, dynamic> search({
    required String searchWord,
    required String type,
    required String jobPageNo,
    required String companyPageNo,
  }) {
    return {
      'search': searchWord,
      'type': type,
      'job_page_no': jobPageNo,
      'company_page_no': companyPageNo,
    };
  }

  static Map<String, dynamic> courses({
    required String page,
    required String categoryId,
  }) {
    return {
      'page': page,
      'category_id': categoryId,

    };
  }

  static Map<String, dynamic> searchCourses({
    required String page,
    required String categoryId,
    required String searchWord,
  }) {
    return {
      'page': page,
      'category_id': categoryId,
      'search': searchWord,
    };
  }

  static Map<String, dynamic> coursesDtl({
    required String coursesId,
  }) {
    return {
      'course_id': coursesId
    };
  }

  static Map<String, dynamic> savedItem({
    required String type,
    required String page,
  }) {
    return {
      'type': type,
      'page': page
    };
  }
  static Map<String, dynamic> itemSavedRemoved({
    required String itemId,
    required String itemType,
  }) {
    return {
      'item_id': itemId,
      'item_type': itemType,
    };
  }

  static Object updateLanguage({
    required List<String> loc,
  }) {
    return {
      'languages': loc
    };
  }
  static Object updateHobby({
    required List<String> list,
  }) {
    return {
      'hobbies': list
    };
  }

  static Object updateJobType({
    required List<String> list,
  }) {
    return {
      'job_types': list
    };
  }

  static Map<String, dynamic> updateProfilePic({
    required data.MultipartFile img,
  }) {
    return {
      'profile_picture': img,
    };
  }

  static Object updateProfile({
    required String fullName,
    required String currentPostionId,
    required String mobileNo,
    required String email,
    required String gender,
    required String countryId,
    required String stateId,
    required String cityId,
    required List<String> portfolio,
  }) {
    return {
      'full_name': fullName,
      'current_position_id': currentPostionId,
      'mobile_number': mobileNo,
      'email': email,
      'gender': gender,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'portfolio_website': portfolio
    };
  }

  static Object eduEditDtl({
    required String eduId,
  }) {
    return {
      'education_detail_id': eduId
    };
  }

  static Map<String, dynamic> updateEduDtl({
    required String eduId,
    required String highestQualification,
    required String course,
    required String courseType,
    required String specialization,
    required String universityName,
    required String marks,
    required String startYear,
    required String endYear,
    required String currentlyStdy,


  }) {
    return {
      'education_id': eduId,
      'highest_qualification': highestQualification,
      'course': course,
      'course_type': courseType,
      'specialization': specialization,
      'university_name': universityName,
      'marks': marks,
      'start_year': startYear,
      'end_year': endYear,
      'currently_studying': currentlyStdy,
    };
  }

  static Map<String, dynamic> deleteWorkExpDtl({
    required String workExpId,
  }) {
    return {
      'work_experience_id': workExpId,
    };
  }

  static Map<String, dynamic> deleteEduDtl({
    required String eduId,
  }) {
    return {
      'education_id': eduId,
    };
  }

  static Map<String, dynamic> updateCarrerBrief({
    required String carrerbrief,
  }) {
    return {
      'career_brief': carrerbrief,
    };
  }

  static Map<String, dynamic> cms({
    required String type,
  }) {
    return {
      'type': type,
    };
  }

  static Map<String, dynamic> addWorkExpDtl({
    required String title,
    required String companyName,
    required String salary,
    required String level,
    required String startYear,
    required String endYear,
    required String currentlyWork,


  }) {
    return {
      'title': title,
      'company_name': companyName,
      'salary': salary,
      'level': level,
      'start_year': startYear,
      'end_year': endYear,
      'currently_working': currentlyWork,
    };
  }
  static Object workExpEditDtl({
    required String workExpId,
  }) {
    return {
      'work_experience_id': workExpId
    };
  }

  static Map<String, dynamic> updateWorkExpDtl({
    required String workExpId,
    required String title,
    required String companyName,
    required String salary,
    required String level,
    required String startYear,
    required String endYear,
    required String currentlyWork,
  }) {
    return {
      'work_experience_id': workExpId,
      'title': title,
      'company_name': companyName,
      'salary': salary,
      'level': level,
      'start_year': startYear,
      'end_year': endYear,
      'currently_working': currentlyWork,
    };
  }

  static Map<String, dynamic> notification({
    required String page,
  }) {
    return {
      'page': page,
    };
  }

  static Object changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }

  static Object applySecondRound({
    required String jobAppId,
    required String youTubeLink,
  }) {
    return {
      'job_application_id': jobAppId,
      'youtube_link': youTubeLink,
    };
  }
}
