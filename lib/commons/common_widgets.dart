// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_colors.dart';

class LatoCommonTextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double textSize;
  final FontWeight textweight;
  final int? maxLine;
  const LatoCommonTextWidget(
      {super.key,
      required this.title,
      required this.textColor,
      required this.textSize,
      required this.textweight,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              height: 1.4,

              color: textColor,
              fontSize: textSize,
              fontWeight: textweight),
        ));
  }
}

class LatoCenterCommonTextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double textSize;
  final FontWeight textweight;
  final int? maxLine;
  const LatoCenterCommonTextWidget(
      {super.key,
      required this.title,
      required this.textColor,
      required this.textSize,
      required this.textweight,
       this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Text(
          textAlign: TextAlign.center,
          title,
          maxLines:maxLine ,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                height: 1.4,
                color: textColor,
                fontSize: textSize,
                fontWeight: textweight),
          )),
    );
  }
}

class MulishCenterCommonTextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double textSize;
  final FontWeight textweight;
  const MulishCenterCommonTextWidget(
      {super.key,
      required this.title,
      required this.textColor,
      required this.textSize,
      required this.textweight});

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        title,
        style: GoogleFonts.mulish(
          textStyle: TextStyle(
              height: 1.4,
              color: textColor,
              fontSize: textSize,
              fontWeight: textweight),
        ));
  }
}

class Commonbutton extends StatelessWidget {
  final String button;
  final double horizontalpadding, verticalPadding;
  final VoidCallback ontapped;
  final Color bgcolor, bordercolor, textclr;
  final double borderwidth;
  final FontWeight txtweight;

  const Commonbutton({
    super.key,
    required this.button,
    required this.ontapped,
    required this.horizontalpadding,
    required this.verticalPadding,
    required this.bgcolor,
    required this.borderwidth,
    required this.bordercolor,
    required this.textclr,
    required this.txtweight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalpadding, vertical: verticalPadding),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: borderwidth, color: bordercolor)),
            backgroundColor: bgcolor,
            minimumSize: Size(MediaQuery.of(context).size.width, 50),
          ),
          onPressed: ontapped,
          child: Text(
            button,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: textclr,
              fontWeight: txtweight,
            ),
          )),
    );
  }
}

class Commontextformfeild extends StatelessWidget {
  final TextInputType keyboardPopType;
  final TextEditingController controller;
  final String hintText;
  final String labelname;
  final bool isPassword;
  final bool isObscureText;
  final VoidCallback isSuffixPressed;
  final List<TextInputFormatter>? typeOfRed;
  final ValueChanged onChangeVal;
  final bool isErrorText;
  final String isErrorTextString;
  final IconData iconspic;
  int maxLines;
  int minLines;
  TextInputAction? inputAction;
  final bool enabled;
  final VoidCallback icontap;
  final IconData passwordicon;
  final bool isicon;
  final FormFieldValidator validation;
  final Color suffexiconcolor;
  // final String prefiximage;
  // final bool preitem;

  // bool addInstructions;
  Commontextformfeild(
      {Key? key,
      required this.controller,
      // required this.addInstructions,
      required this.maxLines,
      required this.minLines,
      required this.hintText,
      required this.isPassword,
      required this.isSuffixPressed,
      required this.isObscureText,
      required this.typeOfRed,
      required this.onChangeVal,
      required this.isErrorText,
      required this.isErrorTextString,
      required this.keyboardPopType,
      required this.icontap,
      required this.passwordicon,
      required this.isicon,
      required this.iconspic,
      required this.validation,
      required this.labelname,
      required this.suffexiconcolor,
      // required this.prefiximage,
      // required this.preitem,
        this.inputAction,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      enabled: enabled,
      textInputAction: inputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardPopType,
      controller: controller,
      // readOnly: addInstructions,
      obscureText: isObscureText ? true : false,
      obscuringCharacter: '*',
      // "\u2022",
      cursorColor: appThemecolor,
      inputFormatters: typeOfRed,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: normalblack),
      ),
      cursorWidth: 1,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: Colors.white,

        hintText: hintText,
        errorText: isErrorText ? isErrorTextString : null,
        // prefixIcon: preitem
        //     ? Icon(
        //         iconspic,
        //         size: 15,
        //         color: appThemecolor,
        //       )
        //     : Padding(
        //         padding: const EdgeInsets.all(14),
        //         child: SvgPicture.asset(
        //           prefiximage,
        //           height: 16,
        //           color: appThemecolor,
        //         ),
        //       ),
        labelStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: hintcolor, fontSize: 13, fontWeight: FontWeight.w500)),
        label: Text(
          labelname,
          style: const TextStyle(
              color: hintcolor, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        suffixIcon: GestureDetector(
            onTap: icontap,
            // () {
            //   setState(() {
            //     _showpass = !_showpass;
            //   });
            // },
            child: isicon
                ? Icon(
                    passwordicon,
                    // _showpass ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  )
                : const SizedBox(
                    height: 0,
                  )),

        hintStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: hintcolor, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        // alignLabelWithHint: false,

        filled: true,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        // filled: true,
        //  focusedBorder: InputBorder({BorderSide borderSide = BorderSide.none}),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        //labelText: lablename,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      onChanged: onChangeVal,
      validator: validation,
    );
  }
}
class CommontextformfeildIcons extends StatelessWidget {
  final TextInputType keyboardPopType;
  final TextEditingController controller;
  final String hintText;
  final String labelname;
  final bool isPassword;
  final bool isObscureText;
  final VoidCallback isSuffixPressed;
  final List<TextInputFormatter>? typeOfRed;
  final ValueChanged onChangeVal;
  final bool isErrorText;
  final String isErrorTextString;
  final IconData iconspic;
  int maxLines;
  int minLines;
  TextInputAction? inputAction;
  final bool enabled;
  final VoidCallback icontap;
  final String iconAssetPath;
  final bool isicon;
  final FormFieldValidator validation;
  final Color suffexiconcolor;
  // final String prefiximage;
  // final bool preitem;

  // bool addInstructions;
  CommontextformfeildIcons(
      {Key? key,
        required this.controller,
        // required this.addInstructions,
        required this.maxLines,
        required this.minLines,
        required this.hintText,
        required this.isPassword,
        required this.isSuffixPressed,
        required this.isObscureText,
        required this.typeOfRed,
        required this.onChangeVal,
        required this.isErrorText,
        required this.isErrorTextString,
        required this.keyboardPopType,
        required this.icontap,
        required this.iconAssetPath,
        required this.isicon,
        required this.iconspic,
        required this.validation,
        required this.labelname,
        required this.suffexiconcolor,
        // required this.prefiximage,
        // required this.preitem,
        this.inputAction,
        required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      enabled: enabled,
      textInputAction: inputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardPopType,
      controller: controller,
      // readOnly: addInstructions,
      obscureText: isObscureText ? true : false,
      obscuringCharacter: '*',
      // "\u2022",
      cursorColor: appThemecolor,
      inputFormatters: typeOfRed,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: normalblack),
      ),
      cursorWidth: 1,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: Colors.white,

        hintText: hintText,
        errorText: isErrorText ? isErrorTextString : null,
        // prefixIcon: preitem
        //     ? Icon(
        //         iconspic,
        //         size: 15,
        //         color: appThemecolor,
        //       )
        //     : Padding(
        //         padding: const EdgeInsets.all(14),
        //         child: SvgPicture.asset(
        //           prefiximage,
        //           height: 16,
        //           color: appThemecolor,
        //         ),
        //       ),
        labelStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: hintcolor, fontSize: 13, fontWeight: FontWeight.w500)),
        label: Text(
          labelname,
          style: const TextStyle(
              color: hintcolor, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        suffixIcon: GestureDetector(
            onTap: icontap,
            // () {
            //   setState(() {
            //     _showpass = !_showpass;
            //   });
            // },
            child: isicon
                ? Padding(
              padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                                iconAssetPath,
                  
                              ),
                )
                : const SizedBox(
              height: 0,
            )),

        hintStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: hintcolor, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        // alignLabelWithHint: false,

        filled: true,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        // filled: true,
        //  focusedBorder: InputBorder({BorderSide borderSide = BorderSide.none}),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        //labelText: lablename,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      onChanged: onChangeVal,
      validator: validation,
    );
  }
}
//search
class SearchCommonFeild extends StatelessWidget {
  final TextInputType keyboardPopType;
  final TextEditingController controller;
  final String hintText;
  // final String labelname;
  final bool isPassword;
  final bool isObscureText;
  final VoidCallback isSuffixPressed;
  final List<TextInputFormatter>? typeOfRed;
  final ValueChanged onChangeVal;
  final bool isErrorText;
  final String isErrorTextString;
  final IconData iconspic;
  int maxLines;
  int minLines;
  final bool enabled;
  final VoidCallback icontap;
  final IconData passwordicon;
  final bool isicon;
  final FormFieldValidator validation;
  final Color suffexiconcolor;
  final String prefiximage;
  final bool preitem;

  // bool addInstructions;
  SearchCommonFeild({
    Key? key,
    required this.controller,
    // required this.addInstructions,
    required this.maxLines,
    required this.minLines,
    required this.hintText,
    required this.isPassword,
    required this.isSuffixPressed,
    required this.isObscureText,
    required this.typeOfRed,
    required this.onChangeVal,
    required this.isErrorText,
    required this.isErrorTextString,
    required this.keyboardPopType,
    required this.icontap,
    required this.passwordicon,
    required this.isicon,
    required this.iconspic,
    required this.validation,
    // required this.labelname,
    required this.suffexiconcolor,
    required this.prefiximage,
    required this.preitem,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardPopType,
      controller: controller,
      // readOnly: addInstructions,
      obscureText: isObscureText ? true : false,
      obscuringCharacter: '*',
      // "\u2022",
      cursorColor: appThemecolor,
      inputFormatters: typeOfRed,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: normalblack),
      ),
      cursorWidth: 1,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        fillColor: Colors.white,

        hintText: hintText,
        errorText: isErrorText ? isErrorTextString : null,
        prefixIcon: preitem
            ? Icon(
                iconspic,
                size: 15,
                color: appThemecolor,
              )
            : Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  prefiximage,
                  height: 16,
                  // color: appThemecolor,
                ),
              ),
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        // label: Text(
        //   // labelname,
        //   style: const TextStyle(
        //       color: hintcolor, fontSize: 12, fontWeight: FontWeight.w500),
        // ),
        suffixIcon: GestureDetector(
            onTap: icontap,
            // () {
            //   setState(() {
            //     _showpass = !_showpass;
            //   });
            // },
            child: isicon
                ? Icon(
                    passwordicon,
                    // _showpass ? Icons.visibility_off : Icons.visibility,
                    color: suffexiconcolor,
                  )
                : const SizedBox(
                    height: 0,
                  )),

        hintStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: hintcolor, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        // alignLabelWithHint: false,

        filled: true,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        // filled: true,
        //  focusedBorder: InputBorder({BorderSide borderSide = BorderSide.none}),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        //labelText: lablename,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.8,
          ),
          // borderRadius: BorderRadius.circular(10)
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      onChanged: onChangeVal,
      validator: validation,
    );
  }
}

class Robotocommontext extends StatelessWidget {
  final String title;
  final Color textColor;
  final double textSize;
  final FontWeight textweight;
  const Robotocommontext(
      {super.key,
      required this.title,
      required this.textColor,
      required this.textSize,
      required this.textweight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              height: 1.4,
              color: textColor,
              fontSize: textSize,
              fontWeight: textweight),
        ));
  }
}

class DividerLine extends StatelessWidget {
  final double lineHeight;
  final Color dividercolor;
  const DividerLine(
      {super.key, required this.lineHeight, required this.dividercolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(height: lineHeight, color: dividercolor

          // Color(0xFFCDCDCD),
          ),
    );
  }
}

//common dropdownfeild
class CommonDropdownfeild extends StatelessWidget {
  final String selectionvalue, hinttext;
  final List listoptions;
  final ValueChanged onchanged;
  final FormFieldValidator validation;

  const CommonDropdownfeild(
      {super.key,
      required this.selectionvalue,
      required this.listoptions,
      required this.onchanged,
      required this.hinttext,
      required this.validation});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      value: selectionvalue,
      items: listoptions.map((option) {
        return DropdownMenuItem(
          value: option,
          child: LatoCommonTextWidget(
            title: option,
            textColor: normalblack,
            textSize: 14,
            textweight: FontWeight.w400,
          ),
        );
      }).toList(),
      onChanged: onchanged,
      hint: Text(
        hinttext,
        style: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400)),
      ),
      validator: validation,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        filled: false,
        fillColor: const Color(0xFFf2f2f2),

        // hintStyle: GoogleFonts.poppins(
        //     textStyle: const TextStyle(
        //         fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC))),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFCCCCCC)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
