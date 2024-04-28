class ProfileBannerModel {
  int? id;
  String? title;
  String? description;
  String? image;

  ProfileBannerModel({this.id, this.title, this.description, this.image});

  ProfileBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}