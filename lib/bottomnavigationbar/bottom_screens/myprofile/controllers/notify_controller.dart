
import 'package:get/get.dart';

import '../models/notify_model.dart';

class NotificationShowController extends GetxController {
  RxList<NotifyModel> notificationlist = [
    NotifyModel(
      id: 0,
      maintitle: 'Multi Job Requests Arised',
      subtext:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      showtime: '3 mins ago',
    ),
    NotifyModel(
      id: 1,
      maintitle: 'Your Profile has been Viewed',
      subtext:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      showtime: '3 mins ago',
    ),
      NotifyModel(
      id: 2,
      maintitle: 'Your Profile has been Shortlisted',
      subtext:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      showtime: '3 mins ago',
    )
  ].obs;
}
