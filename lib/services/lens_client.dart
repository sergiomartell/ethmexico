import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sticky/pages/query_wrap.dart';
import 'package:sticky/services/queries.dart';
import '../pages/home.dart';
import 'package:graphql/client.dart';

import 'lens_publications.dart';

// class LensClient extends StatelessWidget {
//   const LensClient({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final HttpLink httpLink = HttpLink('https://api.lens.dev/');

//     // ValueNotifier<GraphQLClient> client = ValueNotifier(
//     //   GraphQLClient(
//     //     link: httpLink,
//     //     cache: GraphQLCache(store: HiveStore()),
//     //   ),
//     // );
//     var client = startClient();

//     return client;
//   }

class LensClient {
  Queries _queries = Queries();
  queryVideos() async {
    final HttpLink _httpLink = HttpLink('https://api.lens.dev/');

    final GraphQLClient client = GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(),
    );

    final QueryOptions options =
        QueryOptions(document: gql(_queries.fetchPublications()));

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
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
        if (lensPubs[i].metadata.media[0].original.mimeType == "video/mp4" &&
            (lensPubs[i].metadata.media[0].original.url.substring(0, 4)) !=
                'ipfs') {
          urls.add(lensPubs[i].metadata.media[0].original.url);
          counter++;
        }
      }
    }

    return urls;
  }
}
