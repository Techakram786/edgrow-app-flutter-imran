

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key, required this.title, });
  final String title;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/noDataFound.svg',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.278,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
