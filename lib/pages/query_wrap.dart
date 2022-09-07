import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sticky/pages/home.dart';
import 'package:sticky/services/queries.dart';

import '../services/lens_publications.dart';

class QueryWrap extends StatefulWidget {
  const QueryWrap({Key? key}) : super(key: key);

  @override
  _QueryWrapState createState() => _QueryWrapState();
}

class _QueryWrapState extends State<QueryWrap> {
  Queries _query = Queries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(document: gql(_query.fetchPublications())),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final publicationsList = result.data?['explorePublications']['items'];
          // print(publicationsList);

          List<LensPublications> lensPubs = List.filled(publicationsList.length,
              LensPublications.fromJson(publicationsList[0]));
          for (var i = 0; i < publicationsList.length; i++) {
            lensPubs[i] = LensPublications.fromJson(publicationsList[i]);
          }
          int counter = 0;
          List<String> urls = <String>[];
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
                urls.add(lensPubs[i].metadata.media[0].original.url);
                counter++;
              }
            }
          }

          return HomePage();
        },
      ),
    );
  }
}
