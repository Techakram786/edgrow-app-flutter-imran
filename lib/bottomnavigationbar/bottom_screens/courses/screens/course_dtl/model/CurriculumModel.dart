import 'VideoData.dart';

class CurriculumModel {
  int? id;
  String? curriculum;
  List<VideosData>? videos;

  CurriculumModel({this.id, this.curriculum, this.videos});

  CurriculumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculum = json['curriculum'];
    if (json['videos'] != null) {
      videos = <VideosData>[];
      json['videos'].forEach((v) {
        videos!.add(VideosData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['curriculum'] = curriculum;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}