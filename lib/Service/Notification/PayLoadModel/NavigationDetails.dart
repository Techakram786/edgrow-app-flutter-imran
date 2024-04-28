class NavigationDetailsModel {
  String? androidChannelId;
  String? type;
  String? id;
  NavigationDetails? navigationDetails;

  NavigationDetailsModel(
      {this.androidChannelId, this.type, this.id, this.navigationDetails});

  NavigationDetailsModel.fromJson(Map<String, dynamic> json) {
    androidChannelId = json['android_channel_id'];
    type = json['type'];
    id = json['id'];
   /* navigationDetails = json['navigation_details'] != null
        ? new NavigationDetails.fromJson(json['navigation_details'])
        : null;*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['android_channel_id'] = androidChannelId;
    data['type'] = type;
    data['id'] = id;
    if (navigationDetails != null) {
      data['navigation_details'] = navigationDetails!.toJson();
    }
    return data;
  }
}

class NavigationDetails {
  String? pageName;
  Arg? arg;

  NavigationDetails({this.pageName, this.arg});

  NavigationDetails.fromJson(Map<String, dynamic> json) {
    pageName = json['pageName'];
    arg = json['arg'] != null ? Arg.fromJson(json['arg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageName'] = pageName;
    if (arg != null) {
      data['arg'] = arg!.toJson();
    }
    return data;
  }
}

class Arg {
  String? id;

  Arg({this.id});

  Arg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}