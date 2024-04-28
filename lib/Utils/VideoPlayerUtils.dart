import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../commons/common_colors.dart';



class VideoPlayerUtils extends StatefulWidget {
  final String? videoUrl;
  final File? videoFile;
  final String? videoType;

  const VideoPlayerUtils({Key? key,  this.videoUrl,  this.videoFile, this.videoType}) : super(key: key);

  @override
  _VideoPlayerUtilsState createState() => _VideoPlayerUtilsState();
}

class _VideoPlayerUtilsState extends State<VideoPlayerUtils> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    if(widget.videoType=='network'){
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
    }else{
      _videoPlayerController = VideoPlayerController.file(widget.videoFile!);
    }

    _chewieController = ChewieController(
      allowMuting: true,
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      fullScreenByDefault: false,
      cupertinoProgressColors: ChewieProgressColors(
        playedColor: appThemecolor,
        backgroundColor: appThemecolor,
        bufferedColor: appThemecolor,
        handleColor: appThemecolor,
      ),
      aspectRatio: 16 / 9,
      allowedScreenSleep: false,
      allowPlaybackSpeedChanging: true,
      autoInitialize: true,
      showControls: true,
      draggableProgressBar: true,
      showOptions: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: appThemecolor.withOpacity(0.7),
        bufferedColor: appThemecolor.withOpacity(0.2),
        handleColor: appThemecolor,
      ),
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Chewie(controller: _chewieController),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
