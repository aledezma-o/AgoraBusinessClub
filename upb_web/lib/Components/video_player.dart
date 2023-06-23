import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoPlayerApp extends StatefulWidget {
  final String videoId;

  VideoPlayerApp({required this.videoId});


  @override
  _VideoPlayerAppState createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {

  final storageRef = FirebaseStorage.instance.ref();

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> futureController;


  @override
  void initState() {
    futureController = _initVideoController();
    super.initState();

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
            child: FutureBuilder(
              future: futureController,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done)
                  {
                    return Chewie(
                        controller: _chewieController,
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
      );
  }
  Future<void> _initVideoController() async {
  final String videoUrl = await storageRef.child(widget.videoId).getDownloadURL();
  _videoPlayerController = VideoPlayerController.network(videoUrl);
  _videoPlayerController.setVolume(0);
  _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 8,
      autoPlay: true,
      looping: true,
      showControls: false,
      isLive : true,
      showOptions:false
    );
}
}