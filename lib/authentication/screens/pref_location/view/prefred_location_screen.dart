import 'package:edgrow_app/authentication/screens/pref_location/model/PrefLocModel.dart';
import 'package:edgrow_app/authentication/screens/pref_location/view_model/pref_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../../../../widget/button.dart';
import '../../../../widget/loader/loader.dart';



class PreferedLocationScreen extends StatelessWidget {


  final PrefLocController _prefLocController = Get.put(PrefLocController());

  TextEditingController locationTextController = TextEditingController();

  PreferedLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(()=>
          Loader.screenLoader(
            loading: _prefLocController.screenLoader.value,
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
                    title: 'Preferred Loaction',
                    textColor: normalblack,
                    textSize: 20,
                    textweight: FontWeight.w700),
                const SizedBox(
                  height: 16,
                ),
                Commontextformfeild(
                  controller: locationTextController,
                  maxLines: 1,
                  minLines: 1,
                  hintText: 'Enter Location',
                  isPassword: false,
                  isSuffixPressed: () {},
                  isObscureText: false,
                  typeOfRed: <TextInputFormatter>[
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
                    validation: (value) {
                      return null;
                    },
                  labelname: 'Enter Location',
                  suffexiconcolor: Colors.grey.shade400,
                  // preitem: false,

                  enabled: true,
                  onChangeVal: (value) {
                    if (value != null && value != '') {
                      _prefLocController.isSearch.value = true;
                      _prefLocController.filteredData.assignAll(
                        _prefLocController.prefLocData
                            .where(
                              (loc) =>
                          loc.title
                              ?.toLowerCase()
                              .contains(value.toLowerCase()) ??
                              false,
                        )
                            .toList(),
                      );
                    } else {
                      locationTextController.clear();

                      // _keySkillController.getKeyCopySillApi();
                      _prefLocController.isSearch.value = false;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                      () =>
                      _prefLocController.isSearch.value
                      ? _buildGridView( _prefLocController.filteredData)
                      : _buildGridViewApi(_prefLocController.prefLocData),
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
                         () => _prefLocController.buttonLoader.value
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
                         RxList<String> list = _prefLocController
                             .selectedIndex
                             .where((item) => item != 0)
                             .map((item) => item.toString())
                             .toList()
                             .obs;
                         if (list.isNotEmpty) {
                           _prefLocController.updatePrefLocApi(loc: list, context: context);
                         } else {
                           Get.snackbar(
                             'Preferred Location',
                             'Please choose location',
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

  Widget _buildGridView(RxList<PrefLocModel> loc) {
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
            _prefLocController.selectedIndex.add(loc[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _prefLocController.selectedIndex
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
                    title: loc[i].title.toString(),
                    textColor: _prefLocController.selectedIndex
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
                      _prefLocController.selectedIndex
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

  Widget _buildGridViewApi(RxList<PrefLocModel> loc) {
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
            _prefLocController.selectedIndex.add(loc[i].id!);

          },
          child: Obx(() => Container(

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18),
              color: _prefLocController.selectedIndex
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
                    title: loc[i].title.toString(),
                    textColor: _prefLocController.selectedIndex
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
                      _prefLocController.selectedIndex
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
