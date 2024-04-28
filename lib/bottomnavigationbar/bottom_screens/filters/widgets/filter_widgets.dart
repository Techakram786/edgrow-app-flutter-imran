import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/checkbox_controller.dart';

class SortListWidget extends StatelessWidget {
  final MyCheckboxController _checkboxController =
      Get.put(MyCheckboxController());

  SortListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: _checkboxController.items.length,
            itemBuilder: (context, index) {
              final item = _checkboxController.items[index];
              return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: LatoCommonTextWidget(
                      title: item.name,
                      textColor: normalblack,
                      textSize: 13,
                      textweight: FontWeight.w500,
                    ),
                  ),
                  leading: Checkbox(
                    activeColor: appThemecolor,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    value: item.isChecked.value,
                    onChanged: (value) {
                      item.isChecked.value = value!;
                      _checkboxController.items.refresh();
                    },
                  ),
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -3));
            },
          ),
        ),
      ],
    );
  }
}

//location class
class LocationWidget extends StatelessWidget {
  final MyCheckboxController _checkboxController =
      Get.put(MyCheckboxController());

  LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: _checkboxController.localcities.length,
            itemBuilder: (context, index) {
              final item = _checkboxController.localcities[index];
              return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: LatoCommonTextWidget(
                      title: item.name,
                      textColor: normalblack,
                      textSize: 13,
                      textweight: FontWeight.w500,
                    ),
                  ),
                  leading: Checkbox(
                    activeColor: appThemecolor,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    value: item.isChecked.value,
                    onChanged: (value) {
                      item.isChecked.value = value!;
                      _checkboxController.items.refresh();
                    },
                  ),
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -3));
            },
          ),
        ),
      ],
    );
  }
}

//jobtype
class JobtypeWidget extends StatelessWidget {
  final MyCheckboxController _checkboxController =
      Get.put(MyCheckboxController());

  JobtypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: _checkboxController.jobtypelist.length,
            itemBuilder: (context, index) {
              final item = _checkboxController.jobtypelist[index];
              return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: LatoCommonTextWidget(
                      title: item.name,
                      textColor: normalblack,
                      textSize: 13,
                      textweight: FontWeight.w500,
                    ),
                  ),
                  leading: Checkbox(
                    activeColor: appThemecolor,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    value: item.isChecked.value,
                    onChanged: (value) {
                      item.isChecked.value = value!;
                      _checkboxController.items.refresh();
                    },
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -3));
            },
          ),
        ),
      ],
    );
  }
}

//level
class LevelTypeWidget extends StatelessWidget {
  final MyCheckboxController _checkboxController =
      Get.put(MyCheckboxController());

  LevelTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: _checkboxController.leveltypelist.length,
            itemBuilder: (context, index) {
              final item = _checkboxController.leveltypelist[index];
              return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: LatoCommonTextWidget(
                      title: item.name,
                      textColor: normalblack,
                      textSize: 13,
                      textweight: FontWeight.w500,
                    ),
                  ),
                  leading: Checkbox(
                    activeColor: appThemecolor,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    value: item.isChecked.value,
                    onChanged: (value) {
                      item.isChecked.value = value!;
                      _checkboxController.items.refresh();
                    },
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -3));
            },
          ),
        ),
      ],
    );
  }
}

//expected salary
class ExpectedSalWidget extends StatelessWidget {
  final MyCheckboxController _checkboxController =
      Get.put(MyCheckboxController());

  ExpectedSalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: _checkboxController.expectedsallist.length,
            itemBuilder: (context, index) {
              final item = _checkboxController.expectedsallist[index];
              return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: LatoCommonTextWidget(
                      title: item.name,
                      textColor: normalblack,
                      textSize: 13,
                      textweight: FontWeight.w500,
                    ),
                  ),
                  leading: Checkbox(
                    activeColor: appThemecolor,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    value: item.isChecked.value,
                    onChanged: (value) {
                      item.isChecked.value = value!;
                      _checkboxController.items.refresh();
                    },
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -3));
            },
          ),
        ),
      ],
    );
  }
}
