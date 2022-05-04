import 'package:flutter/material.dart';
import 'package:manojacademy/widgets/videoplayerwidget.dart';
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

  @override
  void initState() {
    controller = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) {
        controller.play();
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}
