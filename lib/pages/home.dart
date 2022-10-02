import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sticky/pages/pages.dart';
import 'package:sticky/utils/utils.dart';
import 'package:sticky/widgets/widgets.dart';
import 'package:sticky/models/models.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.videos}) : super(key: key);

  final List<LensPublications> videos;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Methods and Functions

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _buildAvatar(context),
        ],
      ),
      drawer: _drawer(),
      extendBodyBehindAppBar: true,
      body: OrientationBuilder(
        builder: ((context, orientation) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildSwiper(orientation),
          );
        }),
      ),
    );
  }

//* Widget Builds

  Padding _buildSwiper(Orientation orientation) {
    return Padding(
      padding: orientation == Orientation.landscape
          ? const EdgeInsets.all(0)
          : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: SwipableStack(
        detectableSwipeDirections: const {
          SwipeDirection.right,
          SwipeDirection.left,
          SwipeDirection.up
        },
        controller: _controller,
        stackClipBehaviour: Clip.none,
        onSwipeCompleted: (index, direction) {
          if (kDebugMode) {
            print('$index, $direction');
            if (direction == SwipeDirection.right) {
              // Hit Lens API to lik
              //_controllerConf.play();
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
          final itemIndex = properties.index % widget.videos.length;
          return StickyCard(
            content: widget.videos[itemIndex],
          );
        },
      ),
    );
  }

  Padding _buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary,
          backgroundImage: AssetImage("assets/images/majorTom.png"),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset("assets/images/menuHeader.png"),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.wallet),
            title: Text(
              'Connect Wallet',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.qrcode),
            title: Text(
              'Access Code',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.gear),
            title: Text(
              'Settings',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.wallet),
            title: Text(
              'FAQ',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
