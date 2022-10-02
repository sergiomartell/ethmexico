import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StickyVideo extends StatefulWidget {
  final String url;
  const StickyVideo({Key? key, required this.url}) : super(key: key);

  @override
  State createState() => _StickyVideoState();
}

class _StickyVideoState extends State<StickyVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

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

  //* Code that runs once

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

  //* Cleaning up

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    //debugPrint("${_controller.value.aspectRatio}");
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: InkWell(
                      onTap: playPause,
                      child: VisibilityDetector(
                          onVisibilityChanged: (VisibilityInfo info) {
                            if (info.visibleFraction == 0) {
                              _controller.pause();
                            }
                          },
                          key: Key(widget.url),
                          child: VideoPlayer(_controller))),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: screen.width * .30,
                    vertical: screen.height * .30),
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
