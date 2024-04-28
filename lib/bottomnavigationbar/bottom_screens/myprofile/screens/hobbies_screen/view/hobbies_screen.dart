import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myprofile/screens/hobbies_screen/model/hobbies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';

import '../../../../../../widget/button.dart';
import '../../../../../../widget/loader/loader.dart';
import '../view_model/hobbies_controller.dart';

class HobbiesScreen extends StatelessWidget {
  final HobbiesController _controller = Get.put(HobbiesController());

  final TextEditingController _textController = TextEditingController();

  HobbiesScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(()=>
          Loader.screenLoader(
            loading: _controller.screenLoader.value,
            myWidget: Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: whitecolor,
                foregroundColor: const Color(0xFFFFFFFF),
                shadowColor: const Color(0xFFFFFFFF),
                surfaceTintColor: const Color(0xFFFFFFFF),
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
                      title: 'Hobbies',
                      textColor: normalblack,
                      textSize: 20,
                      textweight: FontWeight.w700),
                  const SizedBox(
                    height: 16,
                  ),
                  Commontextformfeild(
                    controller: _textController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Type your Hobbies',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: false,
                    typeOfRed: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                      LengthLimitingTextInputFormatter(50),
                    ],
                    isErrorText: false,
                    isErrorTextString: '',
                    keyboardPopType: TextInputType.text,
                    icontap: () {},
                    isicon: false,
                    passwordicon: Icons.visibility,
                    iconspic: Icons.email_outlined,
                    validation: (value) {
                      return null;
                    },
                    labelname: '',
                    suffexiconcolor: Colors.grey.shade400,
                    // preitem: false,

                    enabled: true,
                    onChangeVal: (value) {
                      if (value != null && value != '') {
                        _controller.isSearch.value = true;
                        _controller.filteredList.assignAll(
                          _controller.hobbiesList
                              .where(
                                (loc) =>
                            loc.hobby
                                ?.toLowerCase()
                                .contains(value.toLowerCase()) ??
                                false,
                          )
                              .toList(),
                        );
                      } else {
                        _textController.clear();

                        // _keySkillController.getKeyCopySillApi();
                        _controller.isSearch.value = false;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                        () =>
                    _controller.isSearch.value
                        ? _buildGridView( _controller.filteredList)
                        : _buildGridViewApi(_controller.hobbiesList),
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
                          () => _controller.buttonLoader.value
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
                          RxList<String> list = _controller
                              .selectedIndex
                              .where((item) => item != 0)
                              .map((item) => item.toString())
                              .toList()
                              .obs;
                          if (list.isNotEmpty) {
                            _controller.updateHobbyApi(list: list);
                          } else {
                            Get.snackbar(
                              'Hobby',
                              'Please choose Hobby',
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

  Widget _buildGridView(RxList<HobbiesModel> loc) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: loc.length,
      itemBuilder: (_, i) {


        return GestureDetector(
          onTap: () {
            _controller.selectedIndex.add(loc[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _controller.selectedIndex
                  .where((value) => value == loc[i].id!)
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
                    title: loc[i].hobby.toString(),
                    textColor: _controller.selectedIndex
                        .where((value) => value == loc[i].id!)
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
                      _controller.selectedIndex
                          .remove(loc[i].id!);
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

  Widget _buildGridViewApi(RxList<HobbiesModel> loc) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 45,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      shrinkWrap: true,
      itemCount: loc.length,
      itemBuilder: (_, i) {

        return GestureDetector(
          onTap: () {
            _controller.selectedIndex.add(loc[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _controller.selectedIndex
                  .where((value) => value == loc[i].id!)
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
                    title: loc[i].hobby.toString(),
                    textColor: _controller.selectedIndex
                        .where((value) => value == loc[i].id!)
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
                      _controller.selectedIndex
                          .remove(loc[i].id!);
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
