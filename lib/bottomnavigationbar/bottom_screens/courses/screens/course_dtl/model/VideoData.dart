class VideosData {
  int? id;
  String? image;
  String? title;
  String? videoId;
  String? videoLength;
  int? isPurchaseRequired;

  VideosData(
      {this.id,
        this.image,
        this.title,
        this.videoId,
        this.videoLength,
        this.isPurchaseRequired});

  VideosData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    videoId = json['video_id'];
    videoLength = json['video_length'];
    isPurchaseRequired = json['is_purchase_required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['video_id'] = videoId;
    data['video_length'] = videoLength;
    data['is_purchase_required'] = isPurchaseRequired;
    return data;
  }
}