



import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/second_round_model.dart';
import '../repo/second_round_repo.dart';

class SecondRoundController extends GetxController{

  final _apiRepo = SecondRoundRepository();

  SecondRoundModel? secondRoundModel;

  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  late final String jobAppId;
  @override
  void onInit() {
     jobAppId = Get.arguments['jobAppId'];

    getTopicDtlApi(jobApplId: jobAppId);
    super.onInit();
  }

  Future<void> getTopicDtlApi({required String jobApplId})async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobApplDtl(
      jobApplId: jobApplId,
    );
    var result = await _apiRepo.getTopicDtl(params, token!);

    if (result != null) {

      if (result is Map<String, dynamic>) {
        secondRoundModel =SecondRoundModel.fromJson(result);

        screenLoader.value = false;
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Second Round', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      screenLoader.value = false;
    }
  }


  Future<void> applySecondRoundApi({
    required String youTubeLink,
  }) async {
    buttonLoader.value = true;
    final String? token = await SecureStorage.get(
      key: SecureStorage.accessToken,
    );
    var params = ApiHeaders.applySecondRound(
      jobAppId: jobAppId,
      youTubeLink: youTubeLink,
    );
    var result = await _apiRepo.secondRoundApply(params,token!);

    buttonLoader.value = false;

    if (result != null && result == true) {
      Get.snackbar(
        'Second Round',
        'Submitted Successfully',
        backgroundColor: textfeildborder,
      );
      Get.until((route) => route.settings.name ==RoutesName.jobApplDetailsScreen);
      Get.offNamed(RoutesName.jobApplDetailsScreen);
    } else {
      Get.snackbar(
        'Second Round',
        '$result',
        backgroundColor: textfeildborder,
      );

    }
  }



}