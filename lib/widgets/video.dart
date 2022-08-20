import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StickyVideo extends StatefulWidget {
  final String url;
  const StickyVideo({Key? key, required this.url}) : super(key: key);

  @override
  _StickyVideoState createState() => _StickyVideoState();
}

class _StickyVideoState extends State<StickyVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      widget.url,
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    //_controller.setLooping(true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      _controller.setVolume(100);
      // Plays the video once the widget is build and loaded.
      //
    });
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //_controller.play();
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: InkWell(
                  onTap: () {
                    _controller.play();
                  },
                  child: VideoPlayer(_controller)),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
