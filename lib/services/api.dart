import 'package:graphql/client.dart';

class ApiServices {
  final _httpLink = HttpLink(
  'https://api-mumbai.lens.dev/',
  );

  final GraphQLClient client = GraphQLClient(
  /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(),
  link: _httpLink,
);


  const String readRepositories = r'''
    query ReadRepositories($nRepositories: Int!) {
      viewer {
        repositories(last: $nRepositories) {
          nodes {
            __typename
            id
            name
            viewerHasStarred
          }
        }
      }
    }
  ''';

  final QueryOptions options = QueryOptions(
    document: gql(readRepositories)
  );

  final QueryResult result = await client.query(options);
  print(QueryResult);

  if (result.hasException) {
    print(result.exception.toString());
  }

  //final List<dynamic> repositories =
      //result.data['viewer']['repositories']['nodes'] as List<dynamic>;

}