import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';

class ViewAllImagesOverviewScreen extends StatelessWidget {
  final List<String>? allCollegeImages;
  const ViewAllImagesOverviewScreen({super.key, this.allCollegeImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GridView.builder(
          itemCount: allCollegeImages?.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (_, index) {
            return Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(allCollegeImages![index]),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
    );
  }
}
