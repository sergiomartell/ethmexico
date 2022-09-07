import 'package:flutter/material.dart';
import 'package:sticky/models/models.dart';
import 'package:sticky/widgets/video.dart';

class StickyCard extends StatelessWidget {
  const StickyCard({
    required this.content,
    super.key,
  });
  final LensPublications content;

//* Widget Root

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OrientationBuilder(
      builder: ((context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitPlayer(theme);
        } else {
          return _buildHorPlayer(theme);
        }
      }),
    );
  }

//* Widget Builds

  ClipRRect _buildHorPlayer(ThemeData theme) {
    return ClipRRect(
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: StickyVideo(url: content.metadata.media[0].original.url),
            ),
            Opacity(
              opacity: .5,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    content.metadata.name,
                    style: theme.textTheme.bodySmall!.copyWith(
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
                          /*  avatar: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(content.profile.picture)), */
                          label: Text(content.profile.name),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Chip(
                          avatar: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/lens.png"),
                          ),
                          label: Text(content.profile.handle),
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

  ClipRRect _buildPortraitPlayer(ThemeData theme) {
    return ClipRRect(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StickyVideo(url: content.metadata.media[0].original.url),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.profile.name,
                      style: theme.textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      content.metadata.name,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      content.profile.handle,
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
  }
}
