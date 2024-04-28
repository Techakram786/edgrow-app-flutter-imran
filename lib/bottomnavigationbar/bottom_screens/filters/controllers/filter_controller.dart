import 'package:get/get.dart';

import '../models/filter_model.dart';

class FilterLogController extends GetxController {
  RxList<FilterModel> filterlist = [
    FilterModel(id: 0, titletext: 'Sort By'),
    FilterModel(id: 1, titletext: 'Location'),
    FilterModel(id: 2, titletext: 'Job Type'),
    FilterModel(id: 3, titletext: 'Level'),
    FilterModel(id: 4, titletext: 'Expected Salary'),
  ].obs;
}
