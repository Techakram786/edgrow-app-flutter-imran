class SecondRoundModel {
  String? secondRoundTopic;
  String? youtubeVideoInstructions;

  SecondRoundModel({this.secondRoundTopic, this.youtubeVideoInstructions});

  SecondRoundModel.fromJson(Map<String, dynamic> json) {
    secondRoundTopic = json['second_round_topic'];
    youtubeVideoInstructions = json['youtube_video_instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['second_round_topic'] = secondRoundTopic;
    data['youtube_video_instructions'] = youtubeVideoInstructions;
    return data;
  }
}