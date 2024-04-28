import 'dart:convert';

Notification notificationFromJson(String str) => Notification.fromJson(json.decode(str));
String notificationToJson(Notification data) => json.encode(data.toJson());
class Notification {
  Notification({
      this.title, 
      this.body,});

  Notification.fromJson(dynamic json) {
    title = json['title'];
    body = json['body'];
  }
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}