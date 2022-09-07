import 'dart:async';

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

  //* Methods and Functions

  void playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        // play
        _controller.play();
      }
    });
  }

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.setVolume(100);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: InkWell(
                      onTap: playPause, child: VideoPlayer(_controller)),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    icon: Icon(!_controller.value.isPlaying
                        ? Icons.play_circle_fill
                        : Icons.pause_circle_filled),
                    iconSize: 100,
                    onPressed: playPause,
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
