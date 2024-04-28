class StatusModel {
  String? time;

  StatusModel({this.time});

  StatusModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    return data;
  }
}