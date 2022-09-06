import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StickyVideo extends StatefulWidget {
  final String url;
  const StickyVideo({Key? key, required this.url}) : super(key: key);

  @override
  State createState() => _StickyVideoState();
}

class _StickyVideoState extends State<StickyVideo> with RouteAware {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!); //Subscribe it here
    super.didChangeDependencies();
  }

  /// Called when the current route has been popped off.
  @override
  void didPop() {
    debugPrint("didPop");
    super.didPop();
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @override
  void didPopNext() {
    debugPrint("didPopNext");

    super.didPopNext();
  }

  /// Called when the current route has been pushed.
  @override
  void didPush() {
    debugPrint("didPush");
    super.didPush();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @override
  void didPushNext() {
    debugPrint("didPushNext");
    _controller.pause();
    super.didPushNext();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
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
                  child: Center(child: VideoPlayer(_controller))),
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
