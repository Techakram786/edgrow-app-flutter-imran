import 'dart:io';

import 'package:flutter/material.dart';

import '../commons/common_colors.dart';



class PlatformButton extends StatelessWidget {
  final double borderRadius;
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double? minWidth;
  final String buttonText;
  final String? fontFamily;
  final Color textColor;
  final FontWeight? fontWeight;
  final double? pressedOpacity;
  final double? fontSize;
  final EdgeInsetsGeometry buttonMargin;
  final bool loadingButton;
  const PlatformButton({
    super.key,
    this.borderRadius = 0,
    required this.onPressed,
    this.color = appThemecolor,
    this.height = 44,
    this.minWidth,
    required this.buttonText,
    this.textColor = whitecolor,
    this.fontWeight,
    this.pressedOpacity,
    this.buttonMargin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.fontSize,
    this.fontFamily,
    this.loadingButton = false,
  }) : assert(borderRadius >= 0.0);

  @override
  Widget build(BuildContext context) {
    Widget loader = const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: whitecolor,
        ));
    if (Platform.isIOS) {
      return BouncingButton(
        onTap: onPressed,
        buttonText: buttonText,
        height: height,
        buttonMargin: buttonMargin,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        borderRadius: borderRadius,
        fontFamily: fontFamily,
        minWidth: minWidth,
        loadingButton: loadingButton,
        pressedOpacity: pressedOpacity,
        textColor: textColor,
      );
    } else if (Platform.isAndroid) {
      return BouncingButton(
        onTap: onPressed,
        buttonText: buttonText,
        height: height,
        buttonMargin: buttonMargin,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        borderRadius: borderRadius,
        fontFamily: fontFamily,
        minWidth: minWidth,
        loadingButton: loadingButton,
        pressedOpacity: pressedOpacity,
        textColor: textColor,
      );
    } else {
      return Padding(
        padding: buttonMargin,
        child: SizedBox(
          height: height,
          width: minWidth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: color,
              backgroundColor: color,
            ),
            onPressed: onPressed,
            child: loadingButton
                ? loader
                : Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: textColor,
                        fontWeight: fontWeight,
                        fontFamily: fontFamily),
                  ),
          ),
        ),
      );
    }
  }
}

class BouncingButton extends StatefulWidget {
  final double borderRadius;
  final GestureTapCallback? onTap;
  final Color color;
  final double? height;
  final double? minWidth;
  final String buttonText;
  final String? fontFamily;
  final Color textColor;
  final FontWeight? fontWeight;
  final double? pressedOpacity;
  final double? fontSize;
  final EdgeInsetsGeometry buttonMargin;
  final bool loadingButton;
  const BouncingButton({
    super.key,
    this.borderRadius = 0,
    required this.onTap,
    this.color = appThemecolor,
    this.height,
    this.minWidth,
    required this.buttonText,
    this.textColor = whitecolor,
    this.fontWeight,
    this.pressedOpacity,
    this.buttonMargin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.fontSize,
    this.fontFamily,
    this.loadingButton = false,
  }) : assert(borderRadius >= 0.0);

  @override
  BouncingButtonState createState() => BouncingButtonState();
}

class BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 280,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget loader = const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: whitecolor,
        ));
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Padding(
          padding: widget.buttonMargin,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: widget.color,
            ),
            height: widget.height,
            width: widget.minWidth,
            child: widget.loadingButton
                ? loader
                : Text(
                    widget.buttonText,
                    style: TextStyle(
                        fontSize: widget.fontSize,
                        color: widget.textColor,
                        fontWeight: widget.fontWeight,
                        fontFamily: widget.fontFamily),
                  ),
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
