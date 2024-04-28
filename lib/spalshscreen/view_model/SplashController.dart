import 'dart:async';
import 'package:get/get.dart';
import '../../commons/local_storage/SecureStorage.dart';
import '../../commons/routes/routes_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    var userId = await SecureStorage.get(key: SecureStorage.appUserId);
    var accessToken = await SecureStorage.get(key: SecureStorage.accessToken);
    var currentPostion = await SecureStorage.get(key: SecureStorage.cuurentPosition);
    var contactInfo = await SecureStorage.get(key: SecureStorage.contactInfo);
    var eduDtl = await SecureStorage.get(key: SecureStorage.eduDtl);
    var keySkill = await SecureStorage.get(key: SecureStorage.keySkill);
    var jobPref = await SecureStorage.get(key: SecureStorage.jobPref);
    var prefLoc = await SecureStorage.get(key: SecureStorage.preferedLoc);
    var expSalary = await SecureStorage.get(key: SecureStorage.expSalary);
    var resume = await SecureStorage.get(key: SecureStorage.resume);
    Timer(
        const Duration(seconds: 1),
        ()  {
              if (userId != null || accessToken != null)
                {
                  if (currentPostion == '0')
                    {
                      Get.offAllNamed(RoutesName.currentPositionScreen, );
                    }
                  else if (contactInfo == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (eduDtl == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (keySkill == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (jobPref == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (prefLoc == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (expSalary == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else if (resume == '0')
                    {
                    Get.offAllNamed(RoutesName.chooseFillDtlScreen, );
                    }
                  else
                    {
                      Get.offAllNamed(RoutesName.homeScreen, arguments: {
                        'currentindex': 0,
                        'isChoiseScreen': true,
                        'islog': true
                      });
                    }
                }
              else
                {
                  Get.offAllNamed(RoutesName.boardingScreen);
                /*  final router= AppGoRoutes().router;
                  router.pushNamed(RoutesName.boardingScreen);*/
                }
            });
  }
}
