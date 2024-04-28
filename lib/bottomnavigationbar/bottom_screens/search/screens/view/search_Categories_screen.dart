
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/search/screens/view/tabs/jobs_search_category_screen.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/search/screens/view_model/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../commons/common_colors.dart';
import '../../../../../commons/common_widgets.dart';
import 'tabs/allsearch_category_screen.dart';
import 'tabs/company_category_screen.dart';


class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {

  TextEditingController searchjobcontroller = TextEditingController();
  final SearchHomeController _controller= Get.put(SearchHomeController());
  RxInt tabIndex=0.obs;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: whitecolor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            elevation: 0,
            title: Column(
              children: [
                SearchCommonFeild(
                  controller: searchjobcontroller,
                  maxLines: 1,
                  minLines: 1,
                  hintText: "Math's Faculity",
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
                  isErrorTextString: "Math's Faculity",
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
                    _controller.jobsPage=1;
                    _controller.companyPage=1;
                    switch(tabIndex.value){
                      case 0:
                        if(value.length>1){
                          _controller.searchWord.value=value;
                          _controller.jobList.clear();
                          _controller.companiesList.clear();
                          _controller.getJobApplDtlApi(type: 'all', searchWord:value, jobPageNo: '1', companyPageNo: '1' );
                        }else{
                          _controller.jobList.clear();
                          _controller.companiesList.clear();
                        }

                        break;
                      case 1:
                        if(value.length>1){
                          _controller.searchWord.value=value;
                          _controller.jobList.clear();
                          _controller.companiesList.clear();
                          _controller.getJobApplDtlApi(type: 'jobs', searchWord:value , jobPageNo: '1', companyPageNo: '1' );
                        }else{
                          _controller.jobList.clear();
                        }
                        break;
                      case 2:
                        if(value.length>1){
                          _controller.searchWord.value=value;
                          _controller.jobList.clear();
                          _controller.companiesList.clear();
                          _controller.getJobApplDtlApi(type: 'company', searchWord:value, jobPageNo: '1', companyPageNo: '1'  );
                        }else{
                          _controller.companiesList.clear();
                        }
                        break;
                    }
                  }, preitem: false,
                  prefiximage: 'assets/icons/Search.svg',
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Transform.translate(
                offset: const Offset(0, -15),
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) {
                        tabIndex.value=index;
                        searchjobcontroller.clear();
                        switch(index){
                          case 0:
                            _controller.jobList.clear();
                            _controller.companiesList.clear();
                            _controller.getJobApplDtlApi(type: 'all', searchWord:'', jobPageNo: '1', companyPageNo: '1' );
                            break;
                          case 1:
                            _controller.jobList.clear();
                            _controller.getJobApplDtlApi(type: 'jobs', searchWord:'' , jobPageNo: '1', companyPageNo: '1' );
                            break;
                          case 2:
                            _controller.companiesList.clear();
                            _controller.getJobApplDtlApi(type: 'company', searchWord:'' , jobPageNo: '1', companyPageNo: '1' );
                            break;
                        }
                      },
                      physics: const ScrollPhysics(),
                      indicatorColor: appThemecolor,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: const Color(0xFF434343),
                      // indicatorPadding: EdgeInsets.all(8),
                      indicatorWeight: 4,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3.5,
                          color: appThemecolor,
                        ),
                      ),
                      // isScrollable: true,
                      // controller: DefaultTabController.of(context),
                      // controller: _booktabController,
                      labelColor: appThemecolor,
                      labelStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'jobs',
                        ),
                        Tab(
                          text: 'Company',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    // controller: _booktabController,
                    children: [
                      AllSearchJobsScreen(),
                      JobsSearchCategoryScreen(),
                      CompanySearchJobsScreen(),
                    ]),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.jobList.clear();
    _controller.companiesList.clear();
    _controller.getJobApplDtlApi(type: 'all', searchWord:'', jobPageNo: '1', companyPageNo: '1' );
  }
}
