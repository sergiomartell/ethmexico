import 'package:graphql/client.dart';
import '../models/models.dart'

class ApiServices {
  void fetchResults() async {
  final _httpLink = HttpLink(
    'https://api-mumbai.lens.dev/',
  );
  final GraphQLClient client = GraphQLClient(
  /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(),
  link: _httpLink,
);

  const String readRepositories = r'''
    query ExploreProfiles {
    exploreProfiles(request: { sortCriteria: MOST_FOLLOWERS }) {
      items {
        id
        name
        bio
        isDefault
        attributes {
          displayType
          traitType
          key
          value
        }
        followNftAddress
        metadata
        handle
        picture {
          ... on NftImage {
            contractAddress
            tokenId
            uri
            chainId
            verified
          }
          ... on MediaSet {
            original {
              url
              mimeType
            }
          }
        }
        coverPicture {
          ... on NftImage {
            contractAddress
            tokenId
            uri
            chainId
            verified
          }
          ... on MediaSet {
            original {
              url
              mimeType
            }
          }
        }
        ownedBy
        dispatcher {
          address
          canUseRelay
        }
        stats {
          totalFollowers
          totalFollowing
          totalPosts
          totalComments
          totalMirrors
          totalPublications
          totalCollects
        }
        followModule {
          ... on FeeFollowModuleSettings {
            type
            contractAddress
            amount {
              asset {
                name
                symbol
                decimals
                address
              }
              value
            }
            recipient
          }
          ... on ProfileFollowModuleSettings {
          type
          }
          ... on RevertFollowModuleSettings {
          type
          }
        }
      }
      pageInfo {
        prev
        next
        totalCount
      }
    }
  }
  ''';

  final QueryOptions options = QueryOptions(
    document: gql(readRepositories)
  );
  final QueryResult result = await client.query(options);
    print(result.data[]);

    LensApi lens = LensApi.fromJson(result.data);
    if (result.hasException) {
    print(result.exception.toString());
  }

  }
  
  

  //final List<dynamic> repositories =
      //result.data['viewer']['repositories']['nodes'] as List<dynamic>;

}