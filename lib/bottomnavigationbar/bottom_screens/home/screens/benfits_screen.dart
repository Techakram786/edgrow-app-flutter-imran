import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/responsability_view_widgets.dart';

class BenfitsViewScreen extends StatelessWidget {
  final String? benfits;
  const BenfitsViewScreen({super.key, required this.benfits});

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
                'assets/icons/Benefits.svg',
                height: 13,
              ),
              const SizedBox(
                width: 8,
              ),
              const LatoCommonTextWidget(
                  title: 'Benfits',
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
              return   ResponsibilitesWidget(
                rolestext: '$benfits',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 6,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
