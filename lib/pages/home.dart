import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sticky/pages/profile.dart';
import 'package:sticky/utils/colors.dart';
import 'package:sticky/utils/theme.dart';
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

  /* Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  } */

  late final SwipableStackController _controller;
  /* late ConfettiController _controllerConf; */

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
    //_controllerConf = ConfettiController(duration: const Duration(seconds: 2));
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
          Padding(
            padding: const EdgeInsets.all(10.0),
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
          ),
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
            child: Stack(
              children: [
                Padding(
                  padding: orientation == Orientation.landscape
                      ? const EdgeInsets.all(10)
                      : const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
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
                ),
                /* Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  blastDirection: pi,
                  confettiController: _controllerConf,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                      false, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  createParticlePath: drawStar, // define a custom shape/path.
                ),
              ), */
                /* Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: orientation == Orientation.landscape
                        ? const EdgeInsets.all(20.0)
                        : const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 55),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.primary,
                        backgroundImage:
                            AssetImage("assets/images/majorTom.png"),
                      ),
                    ),
                  ),
                ) */
              ],
            ),
          );
        }),
      ),
    );
  }

  //* Widget Builds
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
