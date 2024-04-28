class CurrentPositionMode {
  int? id;
  String? currentPositionName;

  CurrentPositionMode({this.id, this.currentPositionName});

  CurrentPositionMode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentPositionName = json['current_position_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['current_position_name'] = currentPositionName;
    return data;
  }
}