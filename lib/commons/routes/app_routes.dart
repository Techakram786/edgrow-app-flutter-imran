import 'package:edgrow_app/authentication/screens/pref_location/view/prefred_location_screen.dart';
import 'package:edgrow_app/authentication/screens/upload_cv/view/Upload_cv_resume_screen.dart';
import 'package:edgrow_app/authentication/screens/choose_login_screen.dart';
import 'package:edgrow_app/authentication/screens/contact_info/view/contact_info_details.dart';
import 'package:edgrow_app/authentication/screens/current_position/view/current_postion_screen.dart';
import 'package:edgrow_app/authentication/screens/edu_detail/view/education_details_screen.dart';
import 'package:edgrow_app/authentication/screens/expexted_salary/view/expected_Salary_screen.dart';
import 'package:edgrow_app/authentication/screens/job_pref/view/job_prefernces_screen.dart';
import 'package:edgrow_app/authentication/screens/key_skill/view/key_skills_screen.dart';
import 'package:edgrow_app/authentication/screens/login/view/login_your_account.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myjobs/screens/second_round/view/second_round_screen.dart';

import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../Utils/VideoPlayerUtils.dart';
import '../../authentication/screens/fill_detail/view/fill_the_details_screen.dart';
import '../../authentication/screens/register/view/create_your_profile_screen.dart';
import '../../bottomnavigationbar/bottom_screens/courses/screens/course_dtl/view/course_category_view_screen.dart';
import '../../bottomnavigationbar/bottom_screens/courses/screens/review_order/view/review_order_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/Job_recommended/view/recommeneded_jobs_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/job_dtl/view/applying_job_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/college_view/view/college_view_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/colleges_for_u/view/colleges_for_you_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/job_based_skill/view/job_based_on_your_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/top_courses/view/top_courses_training_screen.dart';
import '../../bottomnavigationbar/bottom_screens/home/screens/view_all_images_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myjobs/screens/job_dtl/view/job_details_view_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/career_goal/view/career_goal_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/edgrow_profile/view/profile_view_details_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/edit_profile/view/edit_profile.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/hobbies_screen/view/hobbies_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/job_criteria/view/job_criteria_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/job_type_screen/view/job_type_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/language_screen/view/language-known_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/my_courses_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/notification/view/notification_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/change_password/view/password_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/privacy_policy/view/privacy_policy_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/term_condition/view/termsandconditions_screen.dart';
import '../../bottomnavigationbar/bottom_screens/myprofile/screens/work_exp/view/work_experience_screen.dart';
import '../../bottomnavigationbar/bottom_screens/search/screens/view/search_categories_screen.dart';
import '../../bottomnavigationbar/view/bottomnavigationbar_screen.dart';
import '../../onboardScreens/view/onboard_view_screen.dart';
import '../../spalshscreen/view/spalshscreen.dart';

class AppRoutes{
  static List<GetPage> appRoutes()=>[
    GetPage(name: RoutesName.splashScreen,
        page: ()=>SplashScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.boardingScreen,
        page: ()=>OnboardingScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.chooseLoginScreen,
        page: ()=>const ChooseLoginRegisterScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.loginScreen,
        page: ()=>const LoginAccountScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.registerScreen,
        page: ()=>const CreateYourProfileScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.currentPositionScreen,
        page: ()=>const CurrentPostionScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.chooseFillDtlScreen,
        page: ()=>FillDetailsToProfileScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.contactInfoScreen,
        page: ()=>const ContactInfoScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.eduDtlScreen,
        page: ()=>const EducationDetailsScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.keySkillScreen,
        page: ()=>KeySkillsScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.jobPrefScreen,
        page: ()=>JobPreferenceScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.prefLocScreen,
        page: ()=> PreferedLocationScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.expSalaryScreen,
        page: ()=> ExpectedSalaryScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.uploadCvScreen,
        page: ()=>const UploadCvResumeScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.homeScreen,
        page: ()=>BottomNavgationBarScreen(currentindex:  Get.arguments['currentindex'], islog:  Get.arguments['islog'],isChoiseScreen: Get.arguments['isChoiseScreen'],),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.searchCategoryScreen,
        page: ()=>const SearchCategoryScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.notificationScreen,
        page: ()=> NotificationScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.recommendedJobScreen,
        page: ()=>RecommendedJobsScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.collegesForuScreen,
        page: ()=>CollegesForYouScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.jobBasedSkillScreen,
        page: ()=>JobBasedonYourSkillsScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.collegeViewScreen,
        page: ()=>const CollegeViewScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.collegeViewAllImgsScreen,
        page: ()=>ViewAllImagesOverviewScreen(allCollegeImages: Get.arguments['colgAllImgs'],),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),

    GetPage(name: RoutesName.jobDetailsScreen,
        page: ()=>const ApplyingJobScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.jobApplDetailsScreen,
        page: ()=>JobdetailsViewScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.coursesDetailScreen,
        page: ()=>const CourseCategoryViewScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.reviewOrderScreen,
        page: ()=> ReviewOrderScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.edgrowProfileScreen,
        page: ()=>const ProfileViewScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.edgrowLanguageScreen,
        page: ()=>LanguageKnownScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.edgrowHobbyScreen,
        page: ()=>HobbiesScreen(),
        transitionDuration:  const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.edgrowJobTypeScreen,
        page: ()=>JobTypeScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.editProfileScreen,
        page: ()=>const EditProfileScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.carrerBreiefScreen,
        page: ()=>const CareerGoalScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.videoPlayerScreen,
        page: ()=> VideoPlayerUtils(videoUrl: Get.arguments['video_uri'],videoType: Get.arguments['video_type'],videoFile: Get.arguments['video_file']),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.secondRoundScreen,
        page: ()=> SecondRoundScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.myCourseViewScreen,
        page: ()=> MyCoursesScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.workExperienceScreen,
        page: ()=> const WorkExperienceScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.termConditionScreen,
        page: ()=>  TermsandConditionsScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.privacyPolicyScreen,
        page: ()=>  PrivacyPolicyScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.changePasswordScreen,
        page: ()=>   ChangePasswordScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.topCoursesScreen,
        page: ()=>  const TopCourseTrainingViewScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
    GetPage(name: RoutesName.jobCriteriaScreen,
        page: ()=>  const JobCriteriaScreen(),
        transitionDuration: const Duration(milliseconds: 380),
        transition: Transition.rightToLeftWithFade
    ),
  ];
}