// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tiktok/models/Video.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {

  ///Video Player Controller
  late VideoPlayerController videoPlayerController;
  late Future initializeVideoPlayer;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset("assets/videos/${widget.video.videoUrl}");
    initializeVideoPlayer = videoPlayerController.initialize();

    videoPlayerController.setLooping(true);
    videoPlayerController.play();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: FutureBuilder(
        future: initializeVideoPlayer,
          builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done)
        {
          return VideoPlayer(videoPlayerController);
        }
        else{
          return Container(color: Colors.grey);
        }
      }),
    );
  }
}
