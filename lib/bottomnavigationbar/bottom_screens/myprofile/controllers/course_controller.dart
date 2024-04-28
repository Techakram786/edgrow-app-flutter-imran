import 'package:get/get.dart';

import '../models/courses_model.dart';

class CourseControllerLog extends GetxController {
  RxList<MyCoursesModel> mycourselist = [
    MyCoursesModel(
      id: 0,
      imageurl: 'assets/images/beginner.png',
      percntagevale: '40%',
      toptitle: 'Professional Maths class for Beginners',
      value: 0.4,
    ),
    MyCoursesModel(
      id: 1,
      imageurl: 'assets/images/beginner.png',
      percntagevale: '80%',
      toptitle: 'Professional Maths class for Beginners',
      value: 0.6,
    ),
    MyCoursesModel(
      id: 1,
      imageurl: 'assets/images/beginner.png',
      percntagevale: '30%',
      toptitle: 'Professional Maths class for Beginners',
      value: 0.3,
    ),
  ].obs;
}
