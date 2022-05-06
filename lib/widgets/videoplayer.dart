import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({Key? key}) : super(key: key);
  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  final videoUrl =
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';
  late VideoPlayerController controller;
  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(videoUrl),
    );
    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
  }
}
