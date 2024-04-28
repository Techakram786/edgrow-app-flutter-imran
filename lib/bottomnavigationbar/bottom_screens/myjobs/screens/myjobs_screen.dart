
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myjobs/screens/tabs/rejected_job_list_screen.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myjobs/screens/tabs/shortlist_by_recuriter_screen.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../commons/common_widgets.dart';
import '../../../../widget/loader/loader.dart';
import '../../../controller/bottomnavbar_controller.dart';

import 'tabs/applied_job_screen.dart';
import 'tabs/intreview_scheduled_screen.dart';

class MyJobsScreen extends StatefulWidget {
   const MyJobsScreen({super.key});

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {


  final BottomNavigationController _controllerMyjob = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Loader.screenLoader(
          loading: _controllerMyjob.screenLoader.value,
         myWidget: DefaultTabController(
              length: 4,
              child: Scaffold(
                  backgroundColor: const Color(0xFFFFFFFF),
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 100,
                    elevation: 0,
                    title: Column(
                      children: [
                        SearchCommonFeild(
                          controller: _controllerMyjob.searchJobController,
                          maxLines: 1,
                          minLines: 1,
                          hintText: 'Search job by Skill,Institute',
                          isPassword: false,
                          isSuffixPressed: () {},
                          isObscureText: false,
                          typeOfRed: <TextInputFormatter>[
                            // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z,A-Z,0-9,@,.,#, ]')),
                            LengthLimitingTextInputFormatter(50),
                          ],
                          isErrorText: false,
                          isErrorTextString: 'please enter Search job by Skill,Institute',
                          keyboardPopType: TextInputType.text,
                          icontap: () {},
                          isicon: false,
                          passwordicon: Icons.visibility,
                          iconspic: Icons.email_outlined,
                          validation: (value) {
                            return null;
                          },
                          // labelname: 'Search job by Skill,Institute',
                          suffexiconcolor: Colors.grey.shade400,
                          // preitem: false,

                          enabled: true,
                          onChangeVal: (value) {
                            _controllerMyjob.myJobList.clear();
                            if(value.length>1){
                              _controllerMyjob.getSearchJobsApi(page: '1', type: _controllerMyjob.jobType.value, searchWord: value);
                            }else{
                              _controllerMyjob.getMyJobs(page: '1', jobType:_controllerMyjob.jobType.value, callType: 'tab');
                            }
                          }, preitem: false,
                          prefiximage: 'assets/icons/Search.svg',
                        ),
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Transform.translate(
                          offset: const Offset(-25, -15),
                          child: Column(
                            children: [
                              TabBar(
                               controller:  _controllerMyjob.myJobTabController,
                                physics: const ScrollPhysics(),
                                indicatorColor: appThemecolor,

                                unselectedLabelColor: const Color(0xFF434343),
                                // indicatorPadding: EdgeInsets.all(8),

                                indicatorWeight: 4,

                                indicator: const UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    width: 3.5,
                                    color: appThemecolor,
                                  ),
                                ),
                                isScrollable: true,
                                // controller: DefaultTabController.of(context),
                                // controller: _booktabController,
                                labelColor: appThemecolor,

                                labelStyle: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.w600)),
                                tabs:  [
                                  Tab(
                                    text: 'Applied (${_controllerMyjob.myJobCountModel?.value.appliedCount ?? 0})',
                                  ),
                                  Tab(
                                    text: 'Rejected (${_controllerMyjob.myJobCountModel?.value.rejectedCount?? 0})',
                                  ),
                                  Tab(
                                    text: 'Shortlisted by Recruiter (${_controllerMyjob.myJobCountModel?.value.shortlistedCount?? 0})',
                                  ),
                                  Tab(
                                    text: 'Interview Scheduled (${_controllerMyjob.myJobCountModel?.value.interviewScheduledCount?? 0})',
                                  ),
                                ],
                                onTap: (index) {
                                  _controllerMyjob.myJobsPage=1;
                                  _controllerMyjob.searchJobController.clear();
                                  switch(index){
                                    case 0:
                                      _controllerMyjob.myJobList.clear();
                                      _controllerMyjob.getMyJobs(page: _controllerMyjob.myJobsPage.toString(), jobType: 'applied', callType: 'tab');
                                      _controllerMyjob.jobType.value='applied';
                                      break;
                                    case 1:
                                      _controllerMyjob.myJobList.clear();
                                      _controllerMyjob.getMyJobs(page:_controllerMyjob.myJobsPage.toString(), jobType: 'rejected', callType: 'tab');
                                      _controllerMyjob.jobType.value='rejected';
                                      break;
                                    case 2:
                                      _controllerMyjob.myJobList.clear();
                                      _controllerMyjob.getMyJobs(page: _controllerMyjob.myJobsPage.toString(), jobType: 'shortlisted ', callType: 'tab');
                                      _controllerMyjob.jobType.value='shortlisted';
                                      break;
                                    case 3:
                                      _controllerMyjob.myJobList.clear();
                                      _controllerMyjob.getMyJobs(page: _controllerMyjob.myJobsPage.toString(), jobType: 'interview_scheduled', callType: 'tab');
                                      _controllerMyjob.jobType.value='interview_scheduled';
                                      break;
                                  }
                                },

                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  body:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _controllerMyjob.myJobTabController,
                            children: [
                              JobAppliedListScreen(),
                              JobRejectedListScreen(),
                              ShortllistbyRecruiterScreen(),
                              InterviewScheduledScreen()
                            ]
                        ),
                      )
                    ],
                  )),
            ),
       ),
    );
  }


}
