class BoardingData {
  int? id;
  String? image;
  String? title;
  String? description;
  int? priority;

  BoardingData({this.id, this.image, this.title, this.description, this.priority});

  BoardingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['priority'] = priority;
    return data;
  }
}