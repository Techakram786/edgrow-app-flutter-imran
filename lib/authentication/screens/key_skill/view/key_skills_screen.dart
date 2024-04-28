import 'package:edgrow_app/authentication/screens/key_skill/model/KeySkillModel.dart';
import 'package:edgrow_app/authentication/screens/key_skill/view_model/key_skill_controller.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../widget/button.dart';

import '../../../../widget/loader/loader.dart';



class KeySkillsScreen extends StatelessWidget {
  final KeySkillController _keySkillController = Get.put(KeySkillController());

  TextEditingController skillTextController = TextEditingController();

  KeySkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(()=>
       Loader.screenLoader(
          loading: _keySkillController.screenLoader.value,
          myWidget: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: whitecolor,
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              physics: const BouncingScrollPhysics(),
              children: [
                const LatoCommonTextWidget(
                  title: 'Key Skills',
                  textColor: normalblack,
                  textSize: 20,
                  textweight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                Commontextformfeild(
                  controller: skillTextController,
                  maxLines: 1,
                  minLines: 1,
                  hintText: 'Type your Skills',
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
                  isErrorTextString: '',
                  keyboardPopType: TextInputType.text,
                  icontap: () {},
                  isicon: false,
                  passwordicon: Icons.visibility,
                  iconspic: Icons.email_outlined,

                  labelname: 'Type your Skills',
                  suffexiconcolor: Colors.grey.shade400,
                  // preitem: false,

                  enabled: true,
                  onChangeVal: (value) {
                    if (value != null && value != '') {
                      _keySkillController.isSearch.value = true;
                      _keySkillController.filteredSkills.assignAll(
                        _keySkillController.keySkillData
                            .where(
                              (skill) =>
                          skill.skillName
                              ?.toLowerCase()
                              .contains(value.toLowerCase()) ??
                              false,
                        )
                            .toList(),
                      );
                    } else {
                      skillTextController.clear();

                      // _keySkillController.getKeyCopySillApi();
                      _keySkillController.isSearch.value = false;
                    }
                  },
                  validation: (value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                      () =>
                       _keySkillController.isSearch.value
                      ? _buildGridView( _keySkillController.filteredSkills)
                      : _buildGridViewApi(_keySkillController.keySkillData),
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
                        () => _keySkillController.buttonLoader.value
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
                        RxList<String> list = _keySkillController
                            .selectedIndex
                            .where((item) => item != 0)
                            .map((item) => item.toString())
                            .toList()
                            .obs;
                        if (list.isNotEmpty) {
                          _keySkillController.updateKeySkillApi(skills: list, context: context);
                        } else {
                          Get.snackbar(
                            'Key Skills',
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

  Widget _buildGridView(RxList<KeySkillModel> skills) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: skills.length,
      itemBuilder: (_, i) {


        return GestureDetector(
          onTap: () {
            _keySkillController.selectedIndex.add(skills[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _keySkillController.selectedIndex
                  .where((value) => value == skills[i].id!)
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
                    title: skills[i].skillName.toString(),
                    textColor: _keySkillController.selectedIndex
                        .where((value) => value == skills[i].id!)
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
                      _keySkillController.selectedIndex
                          .remove(skills[i].id!);
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

  Widget _buildGridViewApi(RxList<KeySkillModel> skills) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: skills.length,
      itemBuilder: (_, i) {

        return GestureDetector(
          onTap: () {
            _keySkillController.selectedIndex.add(skills[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _keySkillController.selectedIndex
                  .where((value) => value == skills[i].id!)
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
                    title: skills[i].skillName.toString(),
                    textColor: _keySkillController.selectedIndex
                        .where((value) => value == skills[i].id!)
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
                      _keySkillController.selectedIndex
                          .remove(skills[i].id!);
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
