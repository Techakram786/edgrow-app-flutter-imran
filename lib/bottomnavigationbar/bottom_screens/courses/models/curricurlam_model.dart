import 'package:get/get.dart';

class CurricalModel {
  final int id;
  final String sectionname;
  final List setofdata;
  final List videotime;
  CurricalModel(
      {required this.id,
      required this.sectionname,
      required this.setofdata,
      required this.videotime});
}

RxList<CurricalModel> curricallistdata = [
  CurricalModel(id: 0, sectionname: 'Section 1 - Introduction', setofdata: [
    '1.Introduction',
    '2.Introduction-2',
    '3.Introduction-3',
    '4.Introduction-4',
    '5.Introduction-5'
  ], videotime: [
    '00:58 sec',
    '00:58 sec',
    '00:58 sec',
    '00:58 sec',
    '00:58 sec'
  ]),
  CurricalModel(
      id: 1,
      sectionname: 'Section 2 - Basics of Maths',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
  CurricalModel(
      id: 2,
      sectionname: 'Section 3 - Depth of Maths',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
  CurricalModel(
      id: 3,
      sectionname: 'Section 4 - Algorthims',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
  CurricalModel(
      id: 4,
      sectionname: 'Section 5 - Interview Skills',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
  CurricalModel(
      id: 5,
      sectionname: 'Section 6 - Advanced Maths',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
  CurricalModel(
      id: 6,
      sectionname: 'Section 7 - Conclusion',
      setofdata: ['1.Introduction', '2.what is Maths'],
      videotime: ['00:58 sec', '04:23 sec']),
].obs;
