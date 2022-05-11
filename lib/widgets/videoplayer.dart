import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late FlickManager flickManager;
  late String temp;

  @override
  void initState() {
    temp = widget.videoUrl;
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight
    ]);
    if (temp != widget.videoUrl) {
      setState(() {
        temp = widget.videoUrl;
      });
      flickManager
          .handleChangeVideo(VideoPlayerController.network(widget.videoUrl));
    }

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return FlickVideoPlayer(
        flickManager: flickManager,
        preferredDeviceOrientation: const [
          DeviceOrientation.portraitUp,
          // DeviceOrientation.landscapeRight,
          // DeviceOrientation.landscapeLeft,
        ],
        systemUIOverlay: const [],
      );
    }

    return FlickVideoPlayer(
      flickManager: flickManager,
    );
  }
}
