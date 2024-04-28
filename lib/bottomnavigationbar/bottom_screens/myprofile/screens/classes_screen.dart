import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../courses/models/curricurlam_model.dart';

import '../widgets/classes_sections_widget.dart';

class Classesviewpartscreen extends StatefulWidget {
  const Classesviewpartscreen({super.key});

  @override
  State<Classesviewpartscreen> createState() => _ClassesviewpartscreenState();
}

class _ClassesviewpartscreenState extends State<Classesviewpartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LatoCommonTextWidget(
                      title: '07 Sections',
                      textColor: responsetextclr,
                      textSize: 10,
                      textweight: FontWeight.w400),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: responsetextclr,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  LatoCommonTextWidget(
                      title: '18 Classes',
                      textColor: responsetextclr,
                      textSize: 10,
                      textweight: FontWeight.w400),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: responsetextclr,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  LatoCommonTextWidget(
                      title: '12 Hrs Class',
                      textColor: responsetextclr,
                      textSize: 10,
                      textweight: FontWeight.w400),
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              ListView.builder(
                  itemCount: curricallistdata.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ClassSectionCard(
                      introductiontitle:
                          curricallistdata[index].setofdata.toString(),
                      sectiontitle: curricallistdata[index].sectionname,
                      countlist: curricallistdata.length,
                      videotext: curricallistdata[index].videotime.toString(),
                      datalist: curricallistdata[index].setofdata,
                      videolist: curricallistdata[index].videotime,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
