import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mindlink_app/widgets/post_widget.dart';

class VideoPost extends StatefulWidget {
  final String postId;

  VideoPost({required this.postId});

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  // Hardcoded asset path
  final String videoAsset = 'assets/my_video.mp4';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoAsset);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          PostWidget(postId: widget.postId, postType: 'video'),
        ],
      ),
    );
  }
}