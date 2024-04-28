
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/job_detail_model.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/resume_data.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/resume_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as data;
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/data_question.dart';
import '../model/question_ans_model.dart';
import '../model/recruiter_details.dart';
import '../repo/job_dtl_repo.dart';

class JobDtlController extends GetxController{

  final _apiRepo = JobDetailRepository();
  final _apiCommonRepo = CommonApiRepository();
   JobDetailsModel? jobDetailsModel;
  RecruiterDetails? recruiterDetails;
  var educationQualList = <String>[].obs;
  var keyskillsList = <String>[].obs;
  var questionList = <DataQuestion>[].obs;
  ResumeModel? resumeModel;
  var resumeList = <ResumesData>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;

  @override
  void onInit() {
    super.onInit();
    String jobId= Get.arguments['jobId'];
    getJobDtlApi(jobId: jobId);
  }

  getJobDtlApi({required String jobId})async {
    screenLoader.value = true;

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobDtl(
      jobId: jobId,
    );
    var result = await _apiRepo.getJobDtl(params, token!);
    // print('result final $result');
    if (result != null) {

      if (result is Map<String, dynamic>) {
        jobDetailsModel =JobDetailsModel.fromJson(result);
        if(jobDetailsModel!.educationQualification!.isNotEmpty){
          educationQualList.value=jobDetailsModel!.educationQualification!;
        }
        if(jobDetailsModel!.recruiterDetails!=null){
          recruiterDetails=jobDetailsModel!.recruiterDetails!;
        }
        if(jobDetailsModel!.keySkills!.isNotEmpty){
          keyskillsList.value=jobDetailsModel!.keySkills!;
        }
        screenLoader.value = false;
        getJobQuesApi(jobId: jobId);
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Job Detail', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      screenLoader.value = false;
    }
  }
  getJobQuesApi({required String jobId})async {
    screenLoader.value = true;

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobDtl(
      jobId: jobId,
    );
    var result = await _apiRepo.getJobQuestion(params, token!);
    // print('result final $result');
    if (result != null) {

      if (result is List) {
        questionList.value=result.map((data) => DataQuestion.fromJson(data)).toList();
        screenLoader.value = false;
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Job Detail', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value = false;
    }
  }

  Future<bool> saveQuesApi({
    required String jobId,
    required List<QuestionAnswerData> ans,
  }) async {
    buttonLoader.value = true;

    // homeSkipData.clear();
    final String? token =
    await SecureStorage.get(key: SecureStorage.accessToken);
    var params = ApiHeaders.saveAns(
      jobId: jobId,
      ans: ans,
    );
    var result = await _apiRepo.saveAns(params, token!);
    // print('result final $result');
    if (result != null) {
      if (result == true) {
        buttonLoader.value = false;
        return true;
      } else {
        buttonLoader.value = false;
        Get.snackbar('Job Detail', '$result',
            backgroundColor: textfeildborder);
        return false;
      }
    } else {
      buttonLoader.value = false;
      return false;
    }
  }


  Future<void> getResumeApi()async {
    screenLoader.value = true;

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var result = await _apiRepo.getResume( token!);
    // print('result final $result');
    if (result != null) {

      if (result is Map<String, dynamic>) {
        resumeModel =ResumeModel.fromJson(result);
        if(resumeModel!.resumes!.isNotEmpty){
          resumeList.value=resumeModel!.resumes!;
        }
        screenLoader.value = false;
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Job Detail', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      screenLoader.value = false;
    }
  }

  Future<bool> applyJobApi({
    required String jobId,
    required String resumeType,
    data.MultipartFile?  file,
     String? resumeId,
    required String coverLetter,
   required data.MultipartFile?  video,

  }) async {
    buttonLoader.value = true;

    // homeSkipData.clear();
    final String? token =
    await SecureStorage.get(key: SecureStorage.accessToken);

    var params = resumeType == 'new'
        ? ApiHeaders.applyJobWithFile(
      jobId: jobId,
      resumeType: resumeType,
      file: file!,
      coverLetter: coverLetter,
      video: video!,
    )
        : ApiHeaders.applyJob(
      jobId: jobId,
      resumeType: resumeType,
      resumeId: resumeId!,
      coverLetter: coverLetter, video: video!,
    );
    var result = await _apiRepo.applyJob(params, token!);
    // print('result final $result');
    if (result != null) {
      if (result == true) {
        buttonLoader.value = false;
        return true;
      } else {
        buttonLoader.value = false;
        Get.snackbar('Job Apply', '$result',
            backgroundColor: textfeildborder);
        return false;
      }
    } else {
      buttonLoader.value = false;
      return false;
    }
  }

  // saved Or remove

  Future<bool> setSavedItemApi({
    required String itemId,
    required String itemType,
  }) async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
      key: SecureStorage.accessToken,
    );
    var params = ApiHeaders.itemSavedRemoved(
      itemId: itemId,
      itemType: itemType,
    );
    var result = await _apiCommonRepo.saveItem(token!, params);

    screenLoader.value = false;

    if (result != null && result == true) {
      return true;
    } else {
      Get.snackbar(
        'Saved Item',
        '$result',
        backgroundColor: textfeildborder,
      );
      return false;
    }
  }


  Future<bool> setRemovedItemApi({
    required String itemId,
    required String itemType,
  }) async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
      key: SecureStorage.accessToken,
    );
    var params = ApiHeaders.itemSavedRemoved(
      itemId: itemId,
      itemType: itemType,
    );
    var result = await _apiCommonRepo.removeItem(token!, params);

    screenLoader.value = false;

    if (result != null && result == true) {
      return true;
    } else {
      Get.snackbar(
        'Remove Item',
        '$result',
        backgroundColor: textfeildborder,
      );
      return false;
    }
  }
}