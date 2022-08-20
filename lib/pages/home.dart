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
  const HomePage({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary,
            backgroundImage: AssetImage("assets/images/majorTom.png"),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SwipableStack(
          detectableSwipeDirections: const {
            SwipeDirection.right,
            SwipeDirection.left,
          },
          controller: _controller,
          stackClipBehaviour: Clip.none,
          onSwipeCompleted: (index, direction) {
            if (kDebugMode) {
              print('$index, $direction');
              if (direction == SwipeDirection.right) {
                // Hit Lens API to like
              } else if (direction == SwipeDirection.left) {
                // Internal Algo
              } else if (direction == SwipeDirection.up) {
                // Hit Lens API Follow
              } else if (direction == SwipeDirection.down) {
                // Do something
              }
            }
          },
          horizontalSwipeThreshold: 0.5,
          verticalSwipeThreshold: 0.4,
          builder: (context, properties) {
            final itemIndex = properties.index % _videos.length;
            return StickyCard(name: "name", assetPath: _videos[itemIndex]);
          },
        ),
      ),
    );
  }
}
