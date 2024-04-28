import 'package:edgrow_app/authentication/screens/job_pref/model/JobPrefModel.dart';
import 'package:edgrow_app/authentication/screens/job_pref/view_model/job_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/button.dart';
import '../../../../widget/loader/loader.dart';



class JobPreferenceScreen extends StatelessWidget {


  final TextEditingController _jobPrefTextController = TextEditingController();

  final JobPrefController _jobPrefController = Get.put(JobPrefController());

  RxList<int> currentindex = <int>[].obs;

  RxList joblist = [
    {'role': 'UI Designer'},
    {'role': 'UX Designer'},
    {'role': 'Sketch'},
    {'role': 'Digital Marketing'}
  ].obs;

  JobPreferenceScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(()=>
       Loader.screenLoader(
          loading: _jobPrefController.screenLoader.value,
          myWidget: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: whitecolor,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/arrowback.svg'),
                ),
              ),
              elevation: 0,
            ),
            body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              physics: const BouncingScrollPhysics(),
              children: [
                const LatoCommonTextWidget(
                    title: 'Job Preferences',
                    textColor: normalblack,
                    textSize: 20,
                    textweight: FontWeight.w700),
                const SizedBox(
                  height: 16,
                ),
                Commontextformfeild(
                  controller: _jobPrefTextController,
                  maxLines: 1,
                  minLines: 1,
                  hintText: 'Enter Job Name',
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
                  isErrorTextString: 'please enter Job Name',
                  keyboardPopType: TextInputType.text,
                  icontap: () {},
                  isicon: false,
                  passwordicon: Icons.visibility,
                  iconspic: Icons.email_outlined,
                  validation: (value) {
                    return null;
                  },
                  labelname: 'Enter Job Name',
                  suffexiconcolor: Colors.grey.shade400,
                  // preitem: false,

                  enabled: true,
                  onChangeVal: (value) {
                    if (value != null && value != '') {
                      _jobPrefController.isSearch.value = true;
                      _jobPrefController.filteredSkills.assignAll(
                        _jobPrefController.jobPrefData
                            .where(
                              (job) =>
                          job.jobName
                              ?.toLowerCase()
                              .contains(value.toLowerCase()) ??
                              false,
                        )
                            .toList(),
                      );
                    } else {
                      _jobPrefTextController.clear();

                      // _keySkillController.getKeyCopySillApi();
                      _jobPrefController.isSearch.value = false;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                      () =>
                      _jobPrefController.isSearch.value
                      ? _buildGridView( _jobPrefController.filteredSkills)
                      : _buildGridViewApi(_jobPrefController.jobPrefData),
                ),
              ],
            ),
              bottomNavigationBar: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                height: 70,
                decoration: const BoxDecoration(color: whitecolor),
                child: Column(
                  children: [
                    Obx(
                          () => _jobPrefController.buttonLoader.value
                          ? PlatformButton(
                        onPressed: () {},
                        buttonText: '',
                        loadingButton: true,
                        borderRadius: 5,
                        height: 50,
                        minWidth: double.infinity,
                      )
                          : PlatformButton(
                        buttonText: 'Submit ',
                        onPressed: () async {
                          RxList<String> list = _jobPrefController
                              .selectedIndex
                              .where((item) => item != 0)
                              .map((item) => item.toString())
                              .toList()
                              .obs;
                          if (list.isNotEmpty) {
                            _jobPrefController.updatejobPrefApi(jobPref: list, context: context);
                          } else {
                            Get.snackbar(
                              'Job Preference',
                              'Please choose skill',
                              backgroundColor: textfeildborder,
                            );
                          }
                        },
                        borderRadius: 5,
                        height: 50,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        minWidth: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(RxList<JobPrefModel> jobs) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: jobs.length,
      itemBuilder: (_, i) {


        return GestureDetector(
          onTap: () {
            _jobPrefController.selectedIndex.add(jobs[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _jobPrefController.selectedIndex
                  .where((value) => value == jobs[i].id!)
                  .isNotEmpty
                  ? appThemecolor
                  : whitecolor,
              border: Border.all(
                  color: const Color(0xFFC1C1C1), // Set the border color
                  width: 0.5 // Set the border width
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 10,
                  child: LatoCenterCommonTextWidget(
                    title: jobs[i].jobName.toString(),
                    textColor: _jobPrefController.selectedIndex
                        .where((value) => value == jobs[i].id!)
                        .isNotEmpty
                        ? whitecolor
                        : normalblack,
                    textSize: 12,
                    textweight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      _jobPrefController.selectedIndex
                          .remove(jobs[i].id!);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: whitecolor,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
        );
      },
    );
  }

  Widget _buildGridViewApi(RxList<JobPrefModel> jobs) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: jobs.length,
      itemBuilder: (_, i) {

        return GestureDetector(
          onTap: () {
            _jobPrefController.selectedIndex.add(jobs[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _jobPrefController.selectedIndex
                  .where((value) => value == jobs[i].id!)
                  .isNotEmpty
                  ? appThemecolor
                  : whitecolor,
              border: Border.all(
                  color: const Color(0xFFC1C1C1), // Set the border color
                  width: 0.5 // Set the border width
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 10,
                  child: LatoCenterCommonTextWidget(
                    title: jobs[i].jobName.toString(),
                    textColor: _jobPrefController.selectedIndex
                        .where((value) => value == jobs[i].id!)
                        .isNotEmpty
                        ? whitecolor
                        : normalblack,
                    textSize: 12,
                    textweight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      _jobPrefController.selectedIndex
                          .remove(jobs[i].id!);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: whitecolor,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
        );
      },
    );
  }
}
