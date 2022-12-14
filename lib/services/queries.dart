import 'package:flutter/material.dart';
import 'package:sticky/models/models.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Queries {
  String fetchPublications() {
    return r'''
      query($request: ExplorePublicationRequest!) {
        explorePublications(request: $request) {
          items {
            __typename 
            ... on Post {
              ...PostFields
            }
            ... on Comment {
              ...CommentFields
            }
            ... on Mirror {
              ...MirrorFields
            }
          }
          pageInfo {
            prev
            next
            totalCount
          }
        }
      }

      fragment MediaFields on Media {
        url
        width
        height
        mimeType
      }

      fragment ProfileFields on Profile {
        id
        name
        bio
        attributes {
          displayType
          traitType
          key
          value
        }
        isFollowedByMe
        isFollowing(who: null)
        followNftAddress
        metadata
        isDefault
        handle
        picture {
          ... on NftImage {
            contractAddress
            tokenId
            uri
            verified
          }
          ... on MediaSet {
            original {
              ...MediaFields
            }
            small {
              ...MediaFields
            }
            medium {
              ...MediaFields
            }
          }
        }
        coverPicture {
          ... on NftImage {
            contractAddress
            tokenId
            uri
            verified
          }
          ... on MediaSet {
            original {
              ...MediaFields
            }
            small {
            ...MediaFields
            }
            medium {
              ...MediaFields
            }
          }
        }
        ownedBy
        dispatcher {
          address
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

      fragment PublicationStatsFields on PublicationStats { 
        totalAmountOfMirrors
        totalAmountOfCollects
        totalAmountOfComments
      }

      fragment MetadataOutputFields on MetadataOutput {
        name
        description
        content
        media {
          original {
            ...MediaFields
          }
          small {
            ...MediaFields
          }
          medium {
            ...MediaFields
          }
        }
        attributes {
          displayType
          traitType
          value
        }
      }

      fragment Erc20Fields on Erc20 {
        name
        symbol
        decimals
        address
      }

      fragment CollectModuleFields on CollectModule {
        __typename
        ... on FreeCollectModuleSettings {
          type
        }
        ... on FeeCollectModuleSettings {
          type
          amount {
            asset {
              ...Erc20Fields
            }
            value
          }
          recipient
          referralFee
        }
        ... on LimitedFeeCollectModuleSettings {
          type
          collectLimit
          amount {
            asset {
              ...Erc20Fields
            }
            value
          }
          recipient
          referralFee
        }
        ... on LimitedTimedFeeCollectModuleSettings {
          type
          collectLimit
          amount {
            asset {
              ...Erc20Fields
            }
            value
          }
          recipient
          referralFee
          endTimestamp
        }
        ... on RevertCollectModuleSettings {
          type
        }
        ... on TimedFeeCollectModuleSettings {
          type
          amount {
            asset {
              ...Erc20Fields
            }
            value
          }
          recipient
          referralFee
          endTimestamp
        }
      }

      fragment PostFields on Post {
        id
        profile {
          ...ProfileFields
        }
        stats {
          ...PublicationStatsFields
        }
        metadata {
          ...MetadataOutputFields
        }
        createdAt
        collectModule {
          ...CollectModuleFields
        }
        referenceModule {
          ... on FollowOnlyReferenceModuleSettings {
            type
          }
        }
        appId
        hidden
        reaction(request: null)
        mirrors(by: null)
        hasCollectedByMe
      }

      fragment MirrorBaseFields on Mirror {
        id
        profile {
          ...ProfileFields
        }
        stats {
          ...PublicationStatsFields
        }
        metadata {
          ...MetadataOutputFields
        }
        createdAt
        collectModule {
          ...CollectModuleFields
        }
        referenceModule {
          ... on FollowOnlyReferenceModuleSettings {
            type
          }
        }
        appId
        hidden
        reaction(request: null)
        hasCollectedByMe
      }

      fragment MirrorFields on Mirror {
        ...MirrorBaseFields
        mirrorOf {
        ... on Post {
            ...PostFields          
        }
        ... on Comment {
            ...CommentFields          
        }
        }
      }

      fragment CommentBaseFields on Comment {
        id
        profile {
          ...ProfileFields
        }
        stats {
          ...PublicationStatsFields
        }
        metadata {
          ...MetadataOutputFields
        }
        createdAt
        collectModule {
          ...CollectModuleFields
        }
        referenceModule {
          ... on FollowOnlyReferenceModuleSettings {
            type
          }
        }
        appId
        hidden
        reaction(request: null)
        mirrors(by: null)
        hasCollectedByMe
      }

      fragment CommentFields on Comment {
        ...CommentBaseFields
        mainPost {
          ... on Post {
            ...PostFields
          }
          ... on Mirror {
            ...MirrorBaseFields
            mirrorOf {
              ... on Post {
                ...PostFields          
              }
              ... on Comment {
                ...CommentMirrorOfFields        
              }
            }
          }
        }
      }

      fragment CommentMirrorOfFields on Comment {
        ...CommentBaseFields
        mainPost {
          ... on Post {
            ...PostFields
          }
          ... on Mirror {
            ...MirrorBaseFields
          }
        }
      }
      ''';
  }

  String fetchProfile() {
    return r'''
      query($request: SingleProfileQueryRequest!) {
        profile(request: $request) {
            id
            name
            bio
            attributes {
              displayType
              traitType
              key
              value
            }
            followNftAddress
            metadata
            isDefault
            picture {
              ... on NftImage {
                contractAddress
                tokenId
                uri
                verified
              }
              ... on MediaSet {
                original {
                  url
                  mimeType
                }
              }
              __typename
            }
            handle
            coverPicture {
              ... on NftImage {
                contractAddress
                tokenId
                uri
                verified
              }
              ... on MediaSet {
                original {
                  url
                  mimeType
                }
              }
              __typename
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
                amount {
                  asset {
                    symbol
                    name
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
      }
    ''';
  }

  String fetchDefaultProfile() {
    return r'''
      query defaultProfile($request: DefaultProfileRequest!) {
        defaultProfile(request: $request) {
          id
        }
      }
    ''';
  }
}

class LensService {
  final HttpLink _link = HttpLink('https://api.lens.dev/');
  final Queries _query = Queries();
  List<LensPublications> videoPosts = [];

  List<LensPublications> filterVideos(List<LensPublications> pubs) {
    List<LensPublications> filtered = [];
    for (var element in pubs) {
      if (element.metadata.media.isNotEmpty) {
        if (element.metadata.media[0].original.mimeType == "video/mp4" &&
            element.metadata.media[0].original.url.substring(0, 4) != 'ipfs') {
          filtered.add(element);
        }
      }
    }
    return filtered;
  }

  Future<dynamic> getLensProfile(String wallet) async {
    debugPrint(wallet);
    try {
      final GraphQLClient client =
          GraphQLClient(link: _link, cache: GraphQLCache());
      final QueryOptions options =
          QueryOptions(document: gql(_query.fetchDefaultProfile()), variables: {
        'request': {'ethereumAddress': wallet}
      });
      final QueryResult result = await client.query(options);
      if (result.hasException) {
        debugPrint("${result.exception}");
      } else {
        final String profileId = result.data?["profile"];
        if (result.data?["profile"] != null) {
          final QueryOptions profileOptions =
              QueryOptions(document: gql(_query.fetchProfile()), variables: {
            'request': {'profileId': profileId}
          });
          final QueryResult res2 = await client.query(profileOptions);
          if (res2.hasException) {
            debugPrint("${res2.exception}");
          } else {
            debugPrint(res2.data.toString());
            LensProfileData profileData = LensProfileData.fromJson(res2.data);
            return profileData;
          }
        } else {
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
