
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../controller/bottomnavbar_controller.dart';
import 'tabs/company_shortlisted_screen.dart';
import 'tabs/courses_shortlisted_screen.dart';
import 'tabs/allshortlisted_screen.dart';
import 'tabs/jobs_shortlisted_screen.dart';

class ShortListedScreen extends StatefulWidget  {
  const ShortListedScreen({super.key});

  @override
  State<ShortListedScreen> createState() => _ShortListedScreenState();
}

class _ShortListedScreenState extends State<ShortListedScreen> {
  TextEditingController searchherecontroller = TextEditingController();
  final BottomNavigationController _controllerShortList = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: whitecolor,
            automaticallyImplyLeading: false,
            // toolbarHeight: 100,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SearchCommonFeild(
                        controller: searchherecontroller,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Search Here',
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
                        isErrorTextString: 'Search Here',
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
                          if(value.length>1){
                            _controllerShortList.getSearchSavedApi(page: '1', type: _controllerShortList.savedType.value, searchWord: value);
                          }else{
                            _controllerShortList.myJobList.clear();

                            _controllerShortList. getSavedItemApi(type:  _controllerShortList.savedType.value, page: '1', callType: 'tab');
                          }
                        }, preitem: false,
                        prefiximage: 'assets/icons/Search.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TabBar(
                        physics: const ScrollPhysics(),
                        indicatorColor: appThemecolor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: daysagocolor,
                        indicatorPadding: const EdgeInsets.all(8),

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
                        labelColor: normalblack,
                        labelStyle: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: normalblack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        onTap: (index) {
                          _controllerShortList.savedPage=1;
                          _controllerShortList.savedPagingItemList.clear();
                          searchherecontroller.clear();
                         switch(index){
                           case 0:
                             _controllerShortList.savedCompanyList.clear();
                             _controllerShortList.getSavedItemApi(type: 'all', page: _controllerShortList.savedPage.toString(), callType: 'tab');
                             _controllerShortList.savedType.value='all';
                             break;
                             case 1:
                               _controllerShortList.getSavedItemApi(type: 'jobs', page:_controllerShortList.savedPage.toString(), callType: 'tab');
                               _controllerShortList.savedType.value='jobs';
                             break;
                           case 2:
                             _controllerShortList.getSavedItemApi(type: 'company', page:_controllerShortList.savedPage.toString(), callType: 'tab');
                             _controllerShortList.savedType.value='company';
                             break;
                           case 3:
                             _controllerShortList.getSavedItemApi(type: 'courses', page: _controllerShortList.savedPage.toString(), callType: 'tab');
                             _controllerShortList.savedType.value='courses';
                             break;

                         }
                        },
                        tabs: const [
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'Jobs',
                          ),
                          Tab(
                            text: 'Company',
                          ),
                          Tab(
                            text: 'Courses',
                          ),
                        ],
                        // controller: _tabController,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -8),
                      child: Container(
                        width: Get.width,
                        height: 0.5,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                )),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    // controller: savedTabController,
                    children: [
                      AllShortlistItemsScreen(),
                      JobsShortlistedScreen(),
                      CompanyShortlistedScreen(),
                      CoursesShortlistScreen()
                    ]),
              )
            ],
          )),
    );
  }
}
