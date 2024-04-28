
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../commons/common_colors.dart';

mixin PaginationLoading {
  static Center loading({Color? color}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: LoadingAnimationWidget.fourRotatingDots(
          color: color ?? appThemecolor,
          size: 40,
        ),
      ),
    );
  }
}
