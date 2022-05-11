// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerWidget extends StatelessWidget {
//   final VideoPlayerController controller;
//   const VideoPlayerWidget({Key? key, required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return controller.value.isInitialized
//         ? SizedBox(height: width / 2.5, width: width / 1.2, child: buildVideo())
//         : SizedBox(
//             width: width - 200,
//             child: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//   }

//   Widget buildVideo() => VideoPlayer(controller);
// }
