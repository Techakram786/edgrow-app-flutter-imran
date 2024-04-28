import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/common_widgets.dart';
import '../widgets/responsability_view_widgets.dart';

class QualificationScreen extends StatelessWidget {
  final String? qualification;
  const QualificationScreen({super.key, required this.qualification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/qualification.svg',
                height: 13,
              ),
              const SizedBox(
                width: 8,
              ),
              const LatoCommonTextWidget(
                  title: 'Qualifications',
                  textColor: normalblack,
                  textSize: 12,
                  textweight: FontWeight.w700),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 1,
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) {
              return  ResponsibilitesWidget(
                rolestext:
                    '$qualification'
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 6,
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
