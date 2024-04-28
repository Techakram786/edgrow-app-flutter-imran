
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';

class CurrentPostionCard extends StatelessWidget {
  final String postionname;
  final Color iconcolor, cardbgcolor, cardtextcolor;
  final VoidCallback postiontap;
  const CurrentPostionCard(
      {super.key,
      required this.postionname,
      required this.iconcolor,
      required this.cardbgcolor,
      required this.cardtextcolor,
      required this.postiontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: postiontap,
      child: Container(
        decoration: BoxDecoration(
            color: cardbgcolor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 08, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: iconcolor,
                    size: 22,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              LatoCenterCommonTextWidget(
                  title: postionname,
                  textColor: cardtextcolor,
                  textSize: 15,
                  textweight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}
