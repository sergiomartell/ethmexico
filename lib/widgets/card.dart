import 'package:flutter/material.dart';
import 'package:sticky/models/models.dart';
import 'package:sticky/widgets/video.dart';

class StickyCard extends StatelessWidget {
  const StickyCard({
    required this.content,
    required this.name,
    required this.assetPath,
    super.key,
  });
  final Content content;
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
                    StickyVideo(url: content.video),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.name,
                            style: theme.textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            content.creator,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            content.handle,
                            style: theme.textTheme.caption!.copyWith(
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
                  StickyVideo(url: content.video),
                  Opacity(
                    opacity: .5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          content.name,
                          style: theme.textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Opacity(
                          opacity: .5,
                          child: Row(
                            children: [
                              Chip(
                                avatar: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(content.avatar)),
                                label: Text(content.creator),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Chip(
                                avatar: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/lens.png"),
                                ),
                                label: Text(content.handle),
                              ),
                            ],
                          ),
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
