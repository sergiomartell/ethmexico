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
  final LensService _lens = LensService();
  List<LensPublications> videoPubs = [];
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
          options: QueryOptions(
            document: gql(_query.fetchPublications()),
            variables: {
              'request': {
                'sortCriteria': 'LATEST',
                'publicationTypes': ['POST'],
                'limit': 50,
                'metadata': {
                  'mainContentFocus': ['VIDEO']
                },
                'noRandomize': false,
                // 'cursor': null,
              }
            },
          ),
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

            List<LensPublications> lensPubs = List.filled(
                publicationsList.length,
                LensPublications.fromJson(publicationsList[0]));
            for (var i = 0; i < publicationsList.length; i++) {
              lensPubs[i] = LensPublications.fromJson(publicationsList[i]);
            }

            videoPubs = _lens.filterVideos(lensPubs);

            // for (var i = 0; i < videoPubs.length; i++) {
            //   print('$i: ${videoPubs[i].metadata.media[0].original.url}');
            // }

            final Map pageInfo =
                result.data!['explorePublications']['pageInfo'];
            final String? fetchMoreCursor = pageInfo['next'];
            print(
                'END DATA INDEX --------------------------------: $fetchMoreCursor');

            FetchMoreOptions opts = FetchMoreOptions(
              variables: {
                'request': {
                  'sortCriteria': 'TOP_COMMENTED',
                  'publicationTypes': ['POST'],
                  'limit': 50,
                  'metadata': {
                    'mainContentFocus': ['VIDEO']
                  },
                  'noRandomize': false,
                  // 'cursor': fetchMoreCursor,
                }
              },
              updateQuery: (previousResultData, fetchMoreResultData) {
                final List<dynamic> repos = [
                  ...previousResultData!['explorePublications']['items']
                      as List<dynamic>,
                  ...fetchMoreResultData!['explorePublications']['items']
                      as List<dynamic>
                ];

                fetchMoreResultData['explorePublications']['items'] = repos;
                return fetchMoreResultData;
              },
            );

            // if (videoPubs.length < 20) {
            //   fetchMore!(opts);
            // }

            return HomePage(videos: videoPubs);
          },
        ),
      ),
    );
  }
}
