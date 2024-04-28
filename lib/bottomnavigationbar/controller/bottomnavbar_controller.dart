import 'package:edgrow_app/bottomnavigationbar/bottom_screens/courses/models/CoursesData.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/courses/models/CoursesModel.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/home_models/Colleges.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/shortlisted/models/paging-model/shortlist_pagedata.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/shortlisted/models/paging-model/shortlist_pagemodel.dart';
import 'package:edgrow_app/bottomnavigationbar/repository/botton_nav_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';

import '../../commons/common_colors.dart';
import '../../commons/local_storage/SecureStorage.dart';
import '../../commons/repo/common_api_repository.dart';
import '../../network/ApiConstant/api_headers.dart';
import '../bottom_screens/courses/models/CoursesCat.dart';
import '../bottom_screens/courses/repo/CourseRepository.dart';
import '../bottom_screens/home/home_models/home_data.dart';
import '../bottom_screens/home/home_models/jobs.dart';
import '../bottom_screens/home/home_models/top_banner.dart';
import '../bottom_screens/home/home_models/top_courses.dart';
import '../bottom_screens/home/home_models/trending_jobs.dart';
import '../bottom_screens/home/home_models/banner.dart';
import '../bottom_screens/myjobs/models/MyJobCountModel.dart';
import '../bottom_screens/myjobs/models/MyJobData.dart';
import '../bottom_screens/myjobs/models/MyJobModel.dart';
import '../bottom_screens/myjobs/repo/my_job-repo.dart';
import '../bottom_screens/myprofile/screens/my_profile/model/myprofile_model.dart';
import '../bottom_screens/myprofile/screens/my_profile/repo/my_profile_repo.dart';
import '../bottom_screens/shortlisted/models/company_data.dart';
import '../bottom_screens/shortlisted/models/job_data.dart';
import '../bottom_screens/shortlisted/models/savedItem_model.dart';
import '../bottom_screens/shortlisted/repo/shortlist_repository.dart';

class BottomNavigationController extends GetxController  with GetSingleTickerProviderStateMixin {
  final _apiHomeRepo = BottomNavRepository();
  final _apiMyjobRepo = MyJobRepository();
  final _apiCoursesRepo = CoursesRepository();
  final _apiShortListRepo = ShortListRepository();
  final _apiCommonRepo = CommonApiRepository();
  final _apiMyProfileRepo = MyProfileRepository();
  //home
  Rx<HomeDataModel>? homeSkipData;
  var screenLoader=false.obs;
  var pageLoader=false.obs;
  var selectedindex =0.obs;
  TopBanner? topBannerData;
  TopBanner? middleBannerData;
  TopBanner? bottomBannerData;
  Banners? banners;
  var trendingJobList = <TrendingJobs>[].obs;
  var collegesList = <Colleges>[].obs;
  var topCoursesList = <TopCourses>[].obs;
  var bottomSliderList = <TopBanner>[].obs;
  var bannersList = <Banners>[].obs;
  var jobsList = <Jobs>[].obs;

  var buttonLoader=false.obs;
  late bool isLogin;
  late TabController myJobTabController;
  //jobs
  Rx<MyJobCountModel>? myJobCountModel;
  MyJobModel? myJobModel;
  var myJobList = <MyJobData>[].obs;
  TextEditingController searchJobController = TextEditingController();
  RxString jobType='applied'.obs;


  // Pagination
  var myJobsPage=1;
  var myJobsCurrentItem=0;
  var myJobsTotalItem=0;
  ScrollController myJobsScrollController = ScrollController();
  // courses
  var coursesCatList = <CoursesCatModel>[].obs;
  CoursesModel? coursesModel;
  var coursesList = <CoursesData>[].obs;
  // Pagination
  var coursesPage=1;
  var coursesCurrentItem=0;
  var coursesTotalItem=0;
  ScrollController coursesScrollController = ScrollController();
  // ShortList
  SavedItemModel? savedItemModel;
  var savedJobList = <JobData>[].obs;
  var savedCompanyList = <CompanyData>[].obs;
  var savedCoursesList = <CoursesData>[].obs;
  RxString savedType='all'.obs;
  //pagination
  ShortlistPagModel? shortlistPagModel;
  var savedPagingItemList = <ShortListPagData>[].obs;
  var savedPage=1;
  var savedcCurrentItem=0;
  var savedTotalItem=0;
  ScrollController savedScrollController = ScrollController();
  // profile
  MyProfileModel? myProfileModel;
  @override
  void onInit() {
    super.onInit();
     isLogin=Get.arguments['islog'];
     myJobTabController = TabController(length: 4, vsync: this);


    switch(selectedindex.value){
      case 0:
        if(isLogin){
          fetchHomeScreen();
          // getHomeloginApi();
        }else{
          getHomeSkipApi();
        }
        break;
      case 1:
        break;
      case 2:
        break;
      default:


    }

    savedScrollController.addListener(() {
       if (savedScrollController.position.pixels ==
           savedScrollController.position.maxScrollExtent) {

         if(savedcCurrentItem<savedTotalItem){
           savedPage=savedPage +1;
           getSavedItemApi(page: savedPage.toString(), type: 'jobs', callType: 'scroll');
         }else{
           pageLoader.value=false;
         }
       }else{
         pageLoader.value=false;
       }
     });

    myJobsScrollController.addListener(() {
      if (myJobsScrollController.position.pixels ==
          myJobsScrollController.position.maxScrollExtent) {

        if( myJobsCurrentItem<myJobsTotalItem){
          myJobsPage= myJobsPage +1;
          getMyJobs(page: myJobsPage.toString(), jobType: jobType.value, callType: 'scroll');

        }else{
          pageLoader.value=false;
        }
      }else{
        pageLoader.value=false;
      }
    });

    coursesScrollController.addListener(() {
      if (coursesScrollController.position.pixels ==
          coursesScrollController.position.maxScrollExtent) {

        if( coursesCurrentItem<coursesTotalItem){
          coursesPage= coursesPage +1;
          getCoursesApi(page: coursesPage.toString(),categoryId: '0', callType: 'scroll');

        }else{
          pageLoader.value=false;
        }
      }else{
        pageLoader.value=false;
      }
    });
  }
  void changeIndex(int index){
    selectedindex.value=index;
    switch(selectedindex.value){
      case 0:
        if(isLogin){
          // getHomeloginApi();
          fetchHomeScreen();
        }else{
           getHomeSkipApi();
        }
        break;
      case 1:
        myJobList.clear();
        searchJobController.clear();
        fetchMyJobsScreen();

        break;
      case 2:
        coursesCatList.clear();
        // getCoursesCatApi();
        fetchCoursesScreen();
        break;
      case 3:
        savedJobList.clear();
        savedCompanyList.clear();
        savedCoursesList.clear();
        getSavedItemApi(type: 'all', page: '1', callType: 'scroll');
        break;
      case 4:
        getMyProfile();
        break;
      default:


    }

  }

  Future<void> fetchHomeScreen() async {
    try {
      screenLoader.value = true;
      // Call all API functions concurrently using Future.wait
      await Future.wait([

          getHomeloginApi(),
        getHomeloginApinext()

      ]);
    } catch (e) {
      // Handle errors here
      print('Error during parallel API calls: $e');
    }finally {
      // Set loading to false after API calls are complete (whether successful or not)
      screenLoader.value = false;
    }
  }
  Future<void> fetchMyJobsScreen() async {
    try {
      screenLoader.value = true;
      // Call all API functions concurrently using Future.wait
      await Future.wait([

        getMyJobCount(),
        getMyJobs(page: '1', jobType: jobType.value, callType: 'tab')

      ]);
    } catch (e) {
      // Handle errors here
      print('Error during parallel API calls: $e');
    }finally {
      // Set loading to false after API calls are complete (whether successful or not)
      screenLoader.value = false;
    }
  }
  Future<void> fetchCoursesScreen() async {
    try {
      screenLoader.value = true;
      // Call all API functions concurrently using Future.wait
      await Future.wait([

        getCoursesCatApi(),
        getCoursesApi(page: '1',categoryId: '0', callType: 'tab')

      ]);
    } catch (e) {
      // Handle errors here
      print('Error during parallel API calls: $e');
    }finally {
      // Set loading to false after API calls are complete (whether successful or not)
      screenLoader.value = false;
    }
  }
  Future<void> getHomeSkipApi()async{
    screenLoader.value=true;
    // homeSkipData.clear();
    var result = await _apiHomeRepo.getHomeSkipData();
    // print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>) {
        homeSkipData=HomeDataModel.fromJson(result).obs;
        if (homeSkipData?.value.topBanner != null) {
          topBannerData=homeSkipData?.value.topBanner!;


        }
        if (homeSkipData?.value.middleBanner != null) {
          middleBannerData=homeSkipData?.value.middleBanner!;

        }
        if (homeSkipData?.value.trendingJobs != null || homeSkipData!.value.trendingJobs!.isNotEmpty) {
          trendingJobList.value=homeSkipData!.value.trendingJobs!;
        }else {

        }
        if (homeSkipData?.value.topCourses != null || homeSkipData!.value.topCourses!.isNotEmpty) {
          topCoursesList.value=homeSkipData!.value.topCourses!;
        }

        if (homeSkipData?.value.listBottomBanners != null) {
          bottomSliderList.value=homeSkipData!.value.listBottomBanners!;
        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Home', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> getHomeloginApi()async{
    screenLoader.value=true;
    // homeSkipData.clear();
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var result = await _apiHomeRepo.getHomeLoginData(token!);
    // print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>) {
        homeSkipData=HomeDataModel.fromJson(result).obs;

        if (homeSkipData?.value.topBanner != null) {
          topBannerData=homeSkipData?.value.topBanner!;


        }
        if (homeSkipData?.value.middleBanner != null) {
          middleBannerData=homeSkipData?.value.middleBanner!;

        }
        if (homeSkipData?.value.trendingJobs != null || homeSkipData!.value.trendingJobs!.isNotEmpty) {
          trendingJobList.value=homeSkipData!.value.trendingJobs!;
        }
        if (homeSkipData?.value.colleges != null || homeSkipData!.value.colleges!.isNotEmpty) {
          collegesList.value=homeSkipData!.value.colleges!;
        }
        if (homeSkipData?.value.topCourses != null || homeSkipData!.value.topCourses!.isNotEmpty) {
          topCoursesList.value=homeSkipData!.value.topCourses!;
          // getHomeloginApinext();
        }

        if (homeSkipData?.value.listBottomBanners != null) {
          bottomSliderList.value=homeSkipData!.value.listBottomBanners!;
        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Home', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> getHomeloginApinext()async{
    screenLoader.value=true;
    // homeSkipData.clear();
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var result = await _apiHomeRepo.getHomeLoginDataNext(token!);
    // print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>) {
       HomeDataModel homeSkipData=HomeDataModel.fromJson(result);

        if (homeSkipData.banners != null || homeSkipData.banners!.isNotEmpty) {
          bannersList.value=homeSkipData.banners!;
        }
        if (homeSkipData.jobs != null || homeSkipData.jobs!.isNotEmpty) {
          jobsList.value=homeSkipData.jobs!;
        }
       if (homeSkipData.bottomBanner != null) {
         bottomBannerData=homeSkipData.bottomBanner!;
       }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Home', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> changeJobStatusApi({
    required String status,
  })async{
    screenLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.jobStatus(
      jobStatus: status,
    );

    var result = await _apiHomeRepo.setJobStatus(params,token!);

    if(result!=null){
      screenLoader.value=false;
      if (result==true) {

       /* Get.snackbar(
            "Job Status", "Status Updated Successfully",
            backgroundColor: textfeildborder);*/

      }else{
        Get.snackbar(
            'Home', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value=false;
    }
  }
  Future<void> getMyJobCount()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiMyjobRepo.getMyJobCount( token!);
    // print('result final $result');
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
        myJobCountModel =MyJobCountModel.fromJson(result).obs;
        // getMyJobs(page: '1', jobType: jobType.value);
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

  Future<void> getMyJobs(
      {
    required String page,
    required String jobType,
    required String callType,
  }
  )async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.myJob(
      page: page, type:jobType,
    );
    var result = await _apiMyjobRepo.getMyJob(params, token!);

    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
        myJobModel =MyJobModel.fromJson(result);

        myJobsTotalItem=myJobModel!.total!;
        myJobsCurrentItem=myJobModel!.to!;
        if(myJobModel!.data!.isNotEmpty){
          if(callType=='tab'){
            myJobList.value=myJobModel!.data!;
          }else{
            myJobList.addAll(myJobModel!.data!);
          }

        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'My Job', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
    }
  }
  Future<void> getSearchJobsApi({
    required String page,
    required String type,
    required String searchWord,
  })async{
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.searchMyJobs(
      page: page, type:type, searchWord: searchWord,
    );
    var result = await _apiMyjobRepo.searchJobs( params,token!);

    if(result!=null){
      screenLoader.value = false;
      if (result is Map<String, dynamic>){
        myJobModel =MyJobModel.fromJson(result);
        if(myJobModel!.data!.isNotEmpty){
          myJobList.value=myJobModel!.data!;
        }
      }
    }else{
      screenLoader.value = false;
      Get.snackbar(
          'Jobs', '$result',
          backgroundColor: textfeildborder);
    }
  }


  Future<void> getCoursesCatApi()async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiCoursesRepo.getCoursesCategory( token!);

    if(result!=null){

      if (result is List) {
        coursesCatList.value=result.map((data) => CoursesCatModel.fromJson(data)).toList();
        // getCoursesApi(page: '1',categoryId: '0');
        screenLoader.value=false;
      }else{

        screenLoader.value=false;
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Home', '$result',
          backgroundColor: textfeildborder);
    }
  }

 Future<void> getCoursesApi({
    required String page,
    required String categoryId,
    required String callType
  })async{
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.courses(
      page: page, categoryId:categoryId,
    );
    var result = await _apiCoursesRepo.getCourses( token!,params);

    if(result!=null){
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>){
        coursesModel =CoursesModel.fromJson(result);
        coursesTotalItem=coursesModel!.total!;
        coursesCurrentItem=coursesModel!.to!;
        if(coursesModel!.data!.isNotEmpty){
          if(callType=='tab'){
            coursesList.value=coursesModel!.data!;
          }else{
            coursesList.addAll(coursesModel!.data!);
          }

        }
      }
    }else{
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      Get.snackbar(
          'Courses', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> getSearchCoursesApi({
    required String page,
    required String categoryId,
    required String searchWord,
  })async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.searchCourses(
      page: page, categoryId:categoryId, searchWord: searchWord,
    );
    var result = await _apiCoursesRepo.getSearchCourses( token!,params);

    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>){
        coursesModel =CoursesModel.fromJson(result);
        if(coursesModel!.data!.isNotEmpty){
          coursesList.value=coursesModel!.data!;
        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Courses', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> getSavedItemApi({
    required String page,
    required String type,
    required String callType
  })async{
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.savedItem(
      type: type, page: page
    );
    var result = await _apiShortListRepo.getSavedItems( token!,params);

    if(result!=null){
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>){
        if(type=='all'){
          savedItemModel =SavedItemModel.fromJson(result);
          if(savedItemModel!.jobs!.isNotEmpty){
            savedJobList.value=savedItemModel!.jobs!;
          }
          if(savedItemModel!.courses!.isNotEmpty){
            savedCoursesList.value=savedItemModel!.courses!;
          }
          if(savedItemModel!.companies!.isNotEmpty){
            savedCompanyList.value=savedItemModel!.companies!;
          }
        }else{
          shortlistPagModel=ShortlistPagModel.fromJson(result);
          savedTotalItem=shortlistPagModel!.total!;
          savedcCurrentItem=shortlistPagModel!.to!;
          if(callType=='tab'){
            if(shortlistPagModel!.data!.isNotEmpty){
              savedPagingItemList.value=shortlistPagModel!.data!;
            }
          }else{
            if(shortlistPagModel!.data!.isNotEmpty){
              savedPagingItemList.addAll(shortlistPagModel!.data!);
            }
          }


        }
      }
    }else{
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      Get.snackbar(
          'ShortList', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> getSearchSavedApi({
    required String page,
    required String type,
    required String searchWord,
  })async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.searchMyJobs(
      page: page, type:type, searchWord: searchWord,
    );
    var result = await _apiShortListRepo.searchSavedItems( params,token!);
    savedJobList.clear();
    savedCoursesList.clear();
    savedCompanyList.clear();
    savedPagingItemList.clear();
    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>){
        if(type=='all'){
          savedItemModel =SavedItemModel.fromJson(result);
          if(savedItemModel!.jobs!.isNotEmpty){
            savedJobList.value=savedItemModel!.jobs!;
          }
          if(savedItemModel!.courses!.isNotEmpty){
            savedCoursesList.value=savedItemModel!.courses!;
          }
          if(savedItemModel!.companies!.isNotEmpty){
            savedCompanyList.value=savedItemModel!.companies!;
          }
        }else{
          shortlistPagModel=ShortlistPagModel.fromJson(result);
          if(shortlistPagModel!.data!.isNotEmpty){
            savedPagingItemList.value=shortlistPagModel!.data!;
          }


        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Courses', '$result',
          backgroundColor: textfeildborder);
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

  // my profile
  Future<void> getMyProfile()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiMyProfileRepo.getMyProfile( token!);
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
        myProfileModel =MyProfileModel.fromJson(result);
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