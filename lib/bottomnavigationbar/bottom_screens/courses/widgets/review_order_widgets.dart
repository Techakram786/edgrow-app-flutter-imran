import 'package:cached_network_image/cached_network_image.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';


class ReviewCardWidget extends StatelessWidget {
  final String imagepic, titlejob, starrating, staramount;
  final String amount;
  final String tagtype;
  const ReviewCardWidget(
      {super.key,
      required this.imagepic,
      required this.titlejob,
      required this.starrating,
      required this.staramount,
      required this.amount,
      required this.tagtype});

  @override
  Widget build(BuildContext context) {
    int starLength = 5;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 144,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(imagepic), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color:tagtype=='best seller'?Colors.green:Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LatoCenterCommonTextWidget(
                        title: tagtype,
                        textweight: FontWeight.w800,
                        textColor: whitecolor,
                        textSize: 9,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        //text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height * 0.16,
              // width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 0.5, color: textfeildborder)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: LatoCommonTextWidget(
                              title: titlejob,
                              textColor: normalblack,
                              textSize: 16,
                              textweight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LatoCommonTextWidget(
                            title: starrating,
                            textColor: starcolor,
                            textSize: 10,
                            textweight: FontWeight.w600),
                        SizedBox(
                          height: 10,
                          width: 75,
                          child: Row(
                            children: [
                              for (var i = 0; i < starLength; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              for (var i = 0; i < 5 - starLength; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                            ],
                          ),
                        ),
                        LatoCommonTextWidget(
                            title: '($staramount)',
                            textColor: const Color(0xFF696969),
                            textSize: 11,
                            textweight: FontWeight.w600)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Robotocommontext(
                        title: '₹$amount',
                        textColor: appThemecolor,
                        textSize: 14,
                        textweight: FontWeight.w600)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
