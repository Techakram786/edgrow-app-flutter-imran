// ignore_for_file: avoid_function_literals_in_foreach_calls, curly_braces_in_flow_control_structures

import 'package:edgrow_app/UpdateCalendar/contactmodel.dart';
import 'package:edgrow_app/commons/common_colors.dart';
import 'package:edgrow_app/commons/common_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';

import 'contactform.dart';

class UpdateCalendarScreen extends StatefulWidget {
  const UpdateCalendarScreen({super.key});

  @override
  State<UpdateCalendarScreen> createState() => _UpdateCalendarScreenState();
}

class _UpdateCalendarScreenState extends State<UpdateCalendarScreen> {
  DateTime chosenDate = DateTime.now();
  List<ContactFormItemScreen> contactForms = List.empty(growable: true);
  TextEditingController dataController = TextEditingController();
  String? selectedFromValue;
  String? selectedToValue;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onAddData('');
    });

    super.initState();
  }

  Future<void> onSaveData() async {
    bool allValid = true;

    contactForms
        .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      List<String> names =
          contactForms.map((e) => e.contactModel.fromTime).toList();
      debugPrint('$names');
    } else {
      debugPrint('Form is Not Valid');
    }
  }

  //Delete specific form
  onRemoveData(ContactModel contact) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (kDebugMode) {
        print(contact.fromTime);
      }
      // int endIndex = 0;
      // int startIndex = 0;

      if (contactForms.length > 1) {
        setState(() {
          int index = contactForms
              .indexWhere((element) => element.contactModel.id == contact.id);

          if (index != -1) {
            final formKeyState = contactForms[index].form3key.currentState;
            if (formKeyState != null && formKeyState.mounted) {
              formKeyState.dispose();
            }

            contactForms.removeAt(index);
          }
        });
      }
    });
  }

  onAddData(data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (data == '') {
        setState(() {
          ContactModel contactModel = ContactModel(
            id: contactForms.length,
            fromTime: '',
            toTime: '',
            pastToTime: '',
            pastFromTime: '',
            last: contactForms.isEmpty ? true : false,
          );
          contactForms.add(ContactFormItemScreen(
              index: contactForms.length,
              contactModel: contactModel,
              onRemove: () => onRemoveData(contactModel),
              onAdd: () => onAddData(''),
              onUpdate: () => onUpdate(contactModel)));
        });
      } else {
        if (kDebugMode) {
          print(data);
        }
        setState(() {
          ContactModel contactModel = ContactModel(
            id: contactForms.length,
            fromTime: data['from_time'],
            toTime: data['to_time'],
            pastToTime: '',
            pastFromTime: '',
            last: contactForms.isEmpty ? true : false,
          );
          if (kDebugMode) {
            print(contactModel.fromTime);
          }

          contactForms.add(ContactFormItemScreen(
              index: contactForms.length,
              contactModel: contactModel,
              onRemove: () => onRemoveData(contactModel),
              onAdd: () => onAddData(''),
              onUpdate: () => onUpdate(contactModel)));
        });
      }
    });
  }

  onUpdate(ContactModel contact) {
    if (kDebugMode) {
      print(contact.pastFromTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
          onPressed: () {
            onAddData('');
          },
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Select Date',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      Text('Select Time Slot',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      if (contactForms.isNotEmpty)
                        for (var i = 0; i < contactForms.length; i++)
                          contactForms[i],
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Commonbutton(
                            button: 'UPDATE CALENDER',
                            ontapped: () {
                              bool allValid = true;

                              contactForms.forEach((element) {
                                allValid = allValid && element.isValidated();
                              });
                              if (allValid) {
                                List<dynamic> names = contactForms
                                    .map((e) => {
                                          'from_time': e.contactModel.fromTime,
                                          'to_time': e.contactModel.toTime
                                        })
                                    .toList();
                                debugPrint('$names');
                                // wingmanModuleController.saveTimeSlots(names);
                              } else {
                                debugPrint('Form is Not Valid');
                              }
                            },
                            horizontalpadding: 0,
                            verticalPadding: 0,
                            bgcolor: appThemecolor,
                            borderwidth: 0,
                            bordercolor: appThemecolor,
                            textclr: whitecolor,
                            txtweight: FontWeight.w500),
                      )
                    ]))));
  }
}
