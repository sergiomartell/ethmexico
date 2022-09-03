import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sticky/utils/colors.dart';
import 'package:sticky/widgets/widgets.dart';
import 'package:swipable_stack/swipable_stack.dart';

const _videos = [
  "assets/videos/stickytest1.mov",
  "assets/videos/stickytest2.mov",
  "assets/videos/stickytest3.mov",
  "assets/videos/stickytest4.mov"
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.videos}) : super(key: key);

  final List<String> videos;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              backgroundImage: AssetImage("assets/images/majorTom.png"),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SwipableStack(
          detectableSwipeDirections: const {
            SwipeDirection.right,
            SwipeDirection.left,
          },
          controller: _controller,
          stackClipBehaviour: Clip.none,
          onSwipeCompleted: (index, direction) {
            if (kDebugMode) {
              print('$index, $direction');
            }
          },
          horizontalSwipeThreshold: 0.9,
          verticalSwipeThreshold: 0.8,
          builder: (context, properties) {
            final itemIndex = properties.index % widget.videos.length;
            return StickyCard(
                name: "name", assetPath: widget.videos[itemIndex]);
          },
        ));
  }
}
