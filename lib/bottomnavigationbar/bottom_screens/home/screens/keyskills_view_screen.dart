
import 'package:flutter/material.dart';

import '../widgets/responsability_view_widgets.dart';

class KeyskillsViewScreen extends StatelessWidget {
  final List<String>? keyskill;
  const KeyskillsViewScreen({super.key, required this.keyskill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: keyskill!.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) {
              return  ResponsibilitesWidget(
                rolestext:
                    '${keyskill?[i]}',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 6,
              );
            },
          ),
        ],
      ),
    );
  }
}
