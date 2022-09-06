import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sticky/pages/pages.dart';
import 'package:sticky/services/services.dart';

import '../models/models.dart';

class QueryWrap extends StatefulWidget {
  const QueryWrap({Key? key}) : super(key: key);

  @override
  State<QueryWrap> createState() => _QueryWrapState();
}

class _QueryWrapState extends State<QueryWrap> {
  final Queries _query = Queries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Query(
          options: QueryOptions(document: gql(_query.fetchPublications())),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final publicationsList =
                result.data?['explorePublications']['items'];
            List<LensPublications> videoPubs = [];
            List<LensPublications> lensPubs = List.filled(
                publicationsList.length,
                LensPublications.fromJson(publicationsList[0]));
            for (var i = 0; i < publicationsList.length; i++) {
              lensPubs[i] = LensPublications.fromJson(publicationsList[i]);
            }

            for (var i = 0; i < lensPubs.length; i++) {
              if (lensPubs[i].metadata.media.isNotEmpty) {
                if (lensPubs[i].metadata.media[0].original.mimeType ==
                        "video/mp4" &&
                    (lensPubs[i]
                            .metadata
                            .media[0]
                            .original
                            .url
                            .substring(0, 4)) !=
                        'ipfs') {
                  videoPubs.add(lensPubs[i]);
                }
              }
            }

            return HomePage(videos: videoPubs);
          },
        ),
      ),
    );
  }
}
