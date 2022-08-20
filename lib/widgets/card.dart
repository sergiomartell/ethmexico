import 'package:flutter/material.dart';
import 'package:sticky/widgets/video.dart';

class StickyCard extends StatelessWidget {
  const StickyCard({
    required this.name,
    required this.assetPath,
    super.key,
  });

  final String name;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OrientationBuilder(
      builder: ((context, orientation) {
        if (orientation == Orientation.portrait) {
          return ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StickyVideo(url: assetPath),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: theme.textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return ClipRRect(
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Stack(
                children: [
                  StickyVideo(url: assetPath),
                  /* Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(14),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black12.withOpacity(0),
                        Colors.black12.withOpacity(.4),
                        Colors.black12.withOpacity(.82),
                      ],
                    ),
                  ),
                ),
              ), */
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Chip(
                          avatar: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/majorTom.png")),
                          label: Text("Daniel"),
                        )),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
