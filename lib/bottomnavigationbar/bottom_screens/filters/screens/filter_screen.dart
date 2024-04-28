// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../controllers/filter_controller.dart';
import '../widgets/filter_widgets.dart';

class FilterSelectionScreen extends StatelessWidget {
  final FilterLogController _filterLogController =
      Get.put(FilterLogController());

  FilterSelectionScreen({super.key});

  RxInt filterindex = 0.obs;
  RxInt buttonindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        elevation: 1,
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
        title: const LatoCommonTextWidget(
          title: 'Filters',
          textColor: normalblack,
          textSize: 16,
          textweight: FontWeight.w600,
        ),
        titleSpacing: -6,
      ),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 100,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _filterLogController.filterlist.length,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                filterindex.value = i;
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: MediaQuery.of(context).size.width,
                                color: filterindex.value == i
                                    ? Colors.blue.shade50
                                    : whitecolor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: LatoCenterCommonTextWidget(
                                          title: _filterLogController
                                              .filterlist[i].titletext,
                                          textColor: filterindex.value == i
                                              ? appThemecolor
                                              : normalblack,
                                          textSize: 14,
                                          textweight: FontWeight.w600),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 50,
                                        width: 3,
                                        color: filterindex.value == i
                                            ? appThemecolor
                                            : whitecolor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      filterindex.value == 0
                          ? SortListWidget()
                          : filterindex.value == 1
                              ? LocationWidget()
                              : filterindex.value == 2
                                  ? JobtypeWidget()
                                  : filterindex.value == 3
                                      ? LevelTypeWidget()
                                      : filterindex.value == 4
                                          ? ExpectedSalWidget()
                                          : const SizedBox(
                                              height: 0,
                                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Obx(
          () => Column(
            children: [
              DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade200),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 40,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: whitecolor),
                            onPressed: () {
                              buttonindex.value = 1;
                            },
                            child: const LatoCenterCommonTextWidget(
                              title: 'Clear Filter',
                              textColor: normalblack,
                              textSize: 13,
                              textweight: FontWeight.w500,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 40,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: appThemecolor),
                            onPressed: () {
                              buttonindex.value = 0;
                            },
                            child: const LatoCenterCommonTextWidget(
                              title: 'Apply Filter',
                              textColor: whitecolor,
                              textSize: 13,
                              textweight: FontWeight.w500,
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
