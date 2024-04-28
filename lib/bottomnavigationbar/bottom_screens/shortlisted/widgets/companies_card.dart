import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widget/loader/pagination_loader.dart';

class ComapnySavedCard extends StatelessWidget {
  final String logopic, title, location, tapicon;
  final VoidCallback tagicontap;
  const ComapnySavedCard(
      {super.key,
      required this.logopic,
      required this.title,
      required this.location,
      required this.tagicontap,
      required this.tapicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: textfeildborder)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
               CachedNetworkImage(
                 imageUrl:logopic,
                  height: 50,
                 width: 70,
                 placeholder: (context, url) => PaginationLoading.loading(), // Placeholder widget
                 errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.8,
                      child: LatoCommonTextWidget(
                          title: title,
                          textColor: normalblack,
                          textSize: 16,
                          textweight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.location_on,
                            size: 10,
                            color: appThemecolor,
                          ),
                        ),
                        LatoCommonTextWidget(
                            title: location,
                            textColor: appThemecolor,
                            textSize: 9,
                            textweight: FontWeight.w500),
                      ],
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: tagicontap,
              child: SvgPicture.asset(
                tapicon,
                height: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
