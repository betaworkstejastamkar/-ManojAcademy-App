import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends StatefulWidget {
  final String type, videoUrl;
  const VideoPlayerCard({Key? key, required this.type, required this.videoUrl})
      : super(key: key);
  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late VideoPlayerController controller;
  late FlickManager flickManager;

  @override
  void initState() {
    if (widget.type == 'network') {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.videoUrl),
      );
    } else {
      flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.file(widget.videoUrl as File),
      );
    }
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
