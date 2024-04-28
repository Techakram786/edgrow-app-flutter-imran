import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../../../../../commons/repo/common_api_repository.dart';
import '../model/search_data.dart';
import '../model/search_model.dart';
import '../repo/search_repo.dart';

class SearchHomeController extends GetxController {
  final _apiRepo = SearchRepository();
  final _apiCommonRepo = CommonApiRepository();
  SearchModel? searchModel;
  var jobList = <SearchData>[].obs;

  var companiesList = <SearchData>[].obs;
  RxString searchWord = ''.obs;
  var screenLoader = false.obs;
  var buttonLoader = false.obs;
  var pageLoader = false.obs;
  var jobsAllPage = 1;
  var jobsAllCurrentItem = 0;
  var jobsAllTotalItem = 0;
  ScrollController jobsAllScrollController = ScrollController();
  var companyAllPage = 1;
  var companyAllCurrentItem = 0;
  var companyAllTotalItem = 0;
  ScrollController companyAllScrollController = ScrollController();
  var jobsPage = 1;
  var jobsCurrentItem = 0;
  var jobsTotalItem = 0;
  ScrollController jobsScrollController = ScrollController();
  var companyPage = 1;
  var companyCurrentItem = 0;
  var companyTotalItem = 0;
  ScrollController companyScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    jobsAllScrollController.addListener(() {
      if (jobsAllScrollController.position.pixels ==
          jobsAllScrollController.position.maxScrollExtent) {
        if (jobsAllCurrentItem < jobsAllTotalItem) {
          jobsAllPage = jobsAllPage + 1;
          getJobApplDtlApi(
              type: 'all',
              searchWord: '',
              jobPageNo: jobsAllPage.toString(),
              companyPageNo: '1');
        } else {
          pageLoader = false.obs;
        }
      } else {
        pageLoader.value = false;
      }
    });
    companyAllScrollController.addListener(() {
      if (companyAllScrollController.position.pixels ==
          companyAllScrollController.position.maxScrollExtent) {
        if (companyAllCurrentItem < companyAllTotalItem) {
          companyAllPage = companyAllPage + 1;
          getJobApplDtlApi(
              type: 'all',
              searchWord: '',
              jobPageNo: '1',
              companyPageNo: companyAllPage.toString());
        } else {
          pageLoader = false.obs;
        }
      } else {
        pageLoader.value = false;
      }
    });
    jobsScrollController.addListener(() {
      if (jobsScrollController.position.pixels ==
          jobsScrollController.position.maxScrollExtent) {
        if (jobsCurrentItem < jobsTotalItem) {
          jobsPage = jobsPage + 1;

          getJobApplDtlApi(
              type: 'jobs',
              searchWord: '',
              jobPageNo: jobsPage.toString(),
              companyPageNo: '1');
        } else {
          pageLoader = false.obs;
        }
      } else {
        pageLoader.value = false;
      }
    });

    companyScrollController.addListener(() {
      if (companyScrollController.position.pixels ==
          companyScrollController.position.maxScrollExtent) {

        if (companyCurrentItem < companyTotalItem) {
          companyPage = companyPage + 1;
          getJobApplDtlApi(
              type: 'company',
              searchWord: '',
              jobPageNo: '1',
              companyPageNo: companyPage.toString());
        } else {
          pageLoader = false.obs;
        }
      } else {
        pageLoader.value = false;
      }
    });
  }

  getJobApplDtlApi({
    required String type,
    required String searchWord,
    required String jobPageNo,
    required String companyPageNo,
  }) async {
    if (jobPageNo == '1' || companyPageNo == '1') {
      screenLoader.value = true;
    } else {
      pageLoader.value = true;
    }
    final String? token =
        await SecureStorage.get(key: SecureStorage.accessToken);
    var params = ApiHeaders.search(
      searchWord: searchWord,
      type: type,
      jobPageNo: jobPageNo,
      companyPageNo: companyPageNo,
    );
    var result = await _apiRepo.getSearchResult(params, token!);

    if (result != null) {
      if (result is Map<String, dynamic>) {
        searchModel = SearchModel.fromJson(result);

        switch (type) {
          case 'all':
            if (searchModel!.jobs!.data!.isNotEmpty) {
              jobsAllTotalItem = searchModel!.jobs!.total!;
              jobsAllCurrentItem = searchModel!.jobs!.to!;
              jobList.addAll(searchModel!.jobs!.data!);
            }
            if (searchModel!.companies!.data!.isNotEmpty) {
              companyAllTotalItem = searchModel!.companies!.total!;
              companyAllCurrentItem = searchModel!.companies!.to!;
              companiesList.addAll(searchModel!.companies!.data!);
            }
            break;
          case 'jobs':
            if (searchModel!.jobs!.data!.isNotEmpty) {
              jobsTotalItem = searchModel!.jobs!.total!;
              jobsCurrentItem = searchModel!.jobs!.to!;
              jobList.addAll(searchModel!.jobs!.data!);
            }
            break;
          case 'company':
            if (searchModel!.companies!.data!.isNotEmpty) {
              companyTotalItem = searchModel!.companies!.total!;
              companyCurrentItem = searchModel!.companies!.to!;
              companiesList.addAll(searchModel!.companies!.data!);
            }
            break;
        }

        if (jobPageNo == '1' || companyPageNo == '1') {
          screenLoader.value = false;
        } else {
          pageLoader.value = false;
        }
      } else {
        if (jobPageNo == '1' || companyPageNo == '1') {
          screenLoader.value = false;
        } else {
          pageLoader.value = false;
        }
        Get.snackbar('Search', '$result', backgroundColor: textfeildborder);
      }
    } else {
      if (jobPageNo == '1' || companyPageNo == '1') {
        screenLoader.value = false;
      } else {
        pageLoader.value = false;
      }
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
