import 'package:edgrow_app/UpdateCalendar/contactmodel.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class ContactFormItemScreen extends StatefulWidget {
  ContactFormItemScreen({
    Key? key,
    required this.contactModel,
    required this.onRemove,
    required this.onUpdate,
    this.index,
    required this.onAdd,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final index;
  ContactModel contactModel;
  final Function onRemove;
  final Function onUpdate;
  final Function onAdd;
  final state = _ContactFormItemScreenState();

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return state;
  }

  TextEditingController dataController = TextEditingController();
  String? selectedFromValue;
  String? selectedToValue;
  final form3key = GlobalKey<FormState>();
  bool isValidated() => state.validate();

}

class _ContactFormItemScreenState extends State<ContactFormItemScreen> {
  @override
  void initState() {
    // ignore: unused_local_variable
    // widget.form3key = GlobalKey<FormState>();
    setState(() {
      widget.selectedFromValue = widget.contactModel.fromTime != ''
          ? widget.contactModel.fromTime
          : null;
      widget.selectedToValue =
          widget.contactModel.toTime != '' ? widget.contactModel.toTime : null;
    });
    super.initState();

    // getRelationship();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.form3key,
      child: Column(children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'From time',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  contentPadding: const EdgeInsets.only(left: 10),
                ),
                child: ButtonTheme(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: Commontextformfeild(
                    controller: widget.dataController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: 'Portfolio Website',
                    isPassword: false,
                    isSuffixPressed: () {},
                    isObscureText: false,
                    typeOfRed: <TextInputFormatter>[
                      // FilteringTextInputFormatter.deny(RegExp("[ ]")),
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-z,A-Z,0-9,@,.,#,]')),
                      LengthLimitingTextInputFormatter(50),
                    ],
                    isErrorText: false,
                    isErrorTextString: 'please enter website',
                    keyboardPopType: TextInputType.text,
                    icontap: () {},
                    isicon: false,
                    passwordicon: Icons.visibility,
                    iconspic: Icons.email_outlined,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter website';
                      } else {
                        return null;
                      }
                    },
                    labelname: 'Portofolio Website',
                    suffexiconcolor: Colors.grey.shade400,
                    // preitem: false,

                    enabled: true,
                    onChangeVal: (value) {},
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Visibility(
            // visible: widget.index != 0 && widget.index + 1 > widget.index,
            // child:
            InkWell(
                onTap: () {
                  widget.onRemove();
                },
                child: const Icon(
                  Icons.delete,
                  color: appThemecolor,
                  size: 15,
                )),
            // ),
            // Text('${widget.index}'),
            // Text(widget.length.toString()),
            // Visibility(
            //   visible: widget.contactModel.last,
            //   child: InkWell(
            //     onTap: () {
            //       widget.onAdd();
            //     },
            //     child: SvgPicture.asset(
            //       'assets/images/wingman/AddIcon.svg',
            //       width: 40,
            //       height: 40,
            //     ),
            //   ),
            // ),
          ],
        ),
      ]),
    );
  }

  bool validate() {
    //Validate Form Fields
    final formState = widget.form3key.currentState;
    if (formState != null) {
      bool isValid = formState.validate();
      if (isValid) formState.save();
      return isValid;
    }
    return false;
    // bool validate = widget.form3key.currentState!.validate();
    // if (validate) widget.form3key.currentState!.save();
    // return validate;
  }
}
