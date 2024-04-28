
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/courses/screens/course_dtl/model/CoursesDtlModel.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/CurriculumModel.dart';
import '../repo/CorsesDtlRepository.dart';



class CoursesDtlController extends GetxController{

  final _apiRepo = CoursesDtlRespository();
  CoursesDtlModel? coursesDtlModel;
  var coursesIncudesList = <String>[].obs;
  var cirriculumList = <CurriculumModel>[].obs;

  var screenLoader=false.obs;
  var buttonLoader=false.obs;

  @override
  void onInit() {
    super.onInit();
    var courseId=Get.arguments['coursesId'];
    getCoursesDtlApi(courseId: courseId);

  }

  getCoursesDtlApi({
    required String courseId,
  })async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.coursesDtl(
      coursesId:courseId,
    );
    var result = await _apiRepo.getCoursesDtl(params, token!);
    // print('result final $result');
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
         coursesDtlModel =CoursesDtlModel.fromJson(result);
        if(coursesDtlModel!.courseIncludes!.isNotEmpty ){
          coursesIncudesList.value=coursesDtlModel!.courseIncludes!;
        }
         if(coursesDtlModel!.sections!.isNotEmpty ){
           cirriculumList.value=coursesDtlModel!.sections!;
         }
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'My Job', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value = false;
    }
  }
}