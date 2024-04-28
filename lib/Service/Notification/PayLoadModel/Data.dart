import 'NavigationDetails.dart';
import 'dart:convert';

PayLoadDataModel dataFromJson(String str) => PayLoadDataModel.fromJson(json.decode(str));
String dataToJson(PayLoadDataModel data) => json.encode(data.toJson());
class PayLoadDataModel {
  PayLoadDataModel({
      this.androidChannelId, 
      this.navigationDetails,});

  PayLoadDataModel.fromJson(dynamic json) {
    androidChannelId = json['android_channel_id'];
    navigationDetails = json['navigation_details'] != null ? NavigationDetails.fromJson(json['navigation_details']) : null;
  }
  String? androidChannelId;
  NavigationDetails? navigationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['android_channel_id'] = androidChannelId;
    if (navigationDetails != null) {
      map['navigation_details'] = navigationDetails?.toJson();
    }
    return map;
  }

}