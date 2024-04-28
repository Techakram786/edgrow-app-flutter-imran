// ignore_for_file: must_be_immutable

import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/responsability_view_widgets.dart';

class BenfitTabscreen extends StatelessWidget {
  BenfitTabscreen({super.key});

  RxBool aboutis = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LatoCommonTextWidget(
                            title: 'About this Course',
                            textColor: normalblack,
                            textSize: 16,
                            textweight: FontWeight.w600),
                        IconButton(
                            onPressed: () {
                              aboutis.value = !aboutis.value;
                            },
                            icon: aboutis.value
                                ? const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: normalblack,
                                    size: 18,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_up_outlined,
                                    color: normalblack,
                                    size: 18,
                                  ))
                      ],
                    ),
                    aboutis.value
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: 5,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, i) {
                              return const ResponsibilitesWidget(
                                rolestext:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has Ipsum is simply dummy text of the printing and typesetting industry.',
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 6,
                              );
                            },
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const DividerLine(lineHeight: 1, dividercolor: Color(0xFFE9E9E9)),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LatoCommonTextWidget(
                        title: 'Share Course',
                        textColor: normalblack,
                        textSize: 16,
                        textweight: FontWeight.w600),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: normalblack,
                          size: 15,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
