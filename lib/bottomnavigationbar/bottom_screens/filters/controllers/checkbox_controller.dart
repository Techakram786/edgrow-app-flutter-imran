import 'package:get/get.dart';

class MyCheckboxController extends GetxController {
  var items = <MyItem>[].obs;
  var localcities = <MyItem>[].obs;
  var jobtypelist = <MyItem>[].obs;
  var leveltypelist = <MyItem>[].obs;
  var expectedsallist = <MyItem>[].obs;

  @override
  void onInit() {
    items.assignAll([
      MyItem('Location Based', false),
      MyItem('High Salary', false),
      MyItem('High Match Score', false),
    ]);
    localcities.assignAll([
      MyItem('Vizag', false),
      MyItem('Kakinada', false),
      MyItem('Hyderabad', false),
      MyItem('Chennai', false),
      MyItem('Kolkata', false),
      MyItem('Mumbai', false),
      MyItem('Kerala', false),
      MyItem('Bhopal', false),
      MyItem('Delhi', false),
      MyItem('Bihar', false),
      MyItem('Patna', false),
    ]);
    //jobtype
    jobtypelist.assignAll([
      MyItem('Maths Senior Faculty', false),
      MyItem('Digital Marketing Trainee', false),
      MyItem('Marketing Trainee', false),
    ]);

    leveltypelist.assignAll([
      MyItem('First Level', false),
      MyItem('Second Level', false),
      MyItem('Third Level', false),
    ]);
    expectedsallist.assignAll([
      MyItem('2.5-3.5 Lakhs Per Year', false),
      MyItem('3.5-4.5 Lakhs Per Year', false),
      MyItem('4.5-5.5 Lakhs Per Year', false),
      MyItem('5.5-6.5 Lakhs Per Year', false),
    ]);
    super.onInit();
  }
}

class MyItem {
  final String name;
  final RxBool isChecked;

  MyItem(this.name, bool isChecked) : isChecked = isChecked.obs;
}

class CheckboxController extends GetxController {
  RxBool isChecked = false.obs;
}
