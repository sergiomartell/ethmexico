class LensPublications {
  LensPublications({
    required this.id,
    required this.profile,
    required this.stats,
    required this.metadata,
    required this.createdAt,
    required this.collectModule,
    required this.appId,
    required this.hidden,
    required this.hasCollectedByMe,
  });
  late final String id;
  late final Profile profile;
  late final Stats stats;
  late final Metadata metadata;
  late final String createdAt;
  late final CollectModule collectModule;

  late final String appId;
  late final bool hidden;

  late final bool hasCollectedByMe;

  LensPublications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = Profile.fromJson(json['profile']);
    stats = Stats.fromJson(json['stats']);
    metadata = Metadata.fromJson(json['metadata']);
    createdAt = json['createdAt'];
    collectModule = CollectModule.fromJson(json['collectModule']);

    appId = json['appId'] ?? "";
    hidden = json['hidden'];

    hasCollectedByMe = json['hasCollectedByMe'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['profile'] = profile.toJson();
    data['stats'] = stats.toJson();
    data['metadata'] = metadata.toJson();
    data['createdAt'] = createdAt;
    data['collectModule'] = collectModule.toJson();

    data['appId'] = appId;
    data['hidden'] = hidden;

    data['hasCollectedByMe'] = hasCollectedByMe;
    return data;
  }
}

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.bio,
    required this.isFollowedByMe,
    required this.isFollowing,
    required this.followNftAddress,
    required this.metadata,
    required this.isDefault,
    required this.handle,
    required this.ownedBy,
    required this.stats,
  });
  late final String id;
  late final String name;
  late final String bio;
  late final bool isFollowedByMe;
  late final bool isFollowing;
  late final String followNftAddress;
  late final String metadata;
  late final bool isDefault;
  late final String handle;
  late final String picture;
  late final String coverPicture;
  late final String ownedBy;

  late final Stats stats;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    bio = json['bio'] ?? "";
    isFollowedByMe = json['isFollowedByMe'];
    isFollowing = json['isFollowing'];
    followNftAddress = json['followNftAddress'];
    metadata = json['metadata'] ?? "";
    isDefault = json['isDefault'];
    handle = json['handle'];

    ownedBy = json['ownedBy'];

    stats = Stats.fromJson(json['stats']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['bio'] = bio;
    data['isFollowedByMe'] = isFollowedByMe;
    data['isFollowing'] = isFollowing;
    data['followNftAddress'] = followNftAddress;
    data['metadata'] = metadata;
    data['isDefault'] = isDefault;
    data['handle'] = handle;

    data['ownedBy'] = ownedBy;

    data['stats'] = stats.toJson();

    return data;
  }
}

class Attributes {
  Attributes({
    required this.traitType,
    required this.key,
    required this.value,
  });

  late final String traitType;
  late final String key;
  late final String value;

  Attributes.fromJson(Map<String, dynamic> json) {
    traitType = json['traitType'] ?? "";
    key = json['key'] ?? "";
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['traitType'] = traitType;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class Picture {
  Picture({
    this.original,
  });
  late final original;

  Picture.fromJson(Map<String, dynamic> json) {
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original.toJson();

    return data;
  }
}

class Original {
  Original({
    required this.url,
    required this.mimeType,
  });
  late final String url;

  late final String mimeType;

  Original.fromJson(Map<String, dynamic> json) {
    url = json['url'];

    mimeType = json['mimeType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;

    data['mimeType'] = mimeType;
    return data;
  }
}

class CoverPicture {
  CoverPicture({
    required this.original,
  });
  late final Original original;

  CoverPicture.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original.toJson();

    return data;
  }
}

class Dispatcher {
  Dispatcher({
    required this.address,
  });
  late final String address;

  Dispatcher.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    return data;
  }
}

class Stats {
  Stats({
    required this.totalFollowers,
    required this.totalFollowing,
    required this.totalPosts,
    required this.totalComments,
    required this.totalMirrors,
    required this.totalPublications,
    required this.totalCollects,
  });
  late final int totalFollowers;
  late final int totalFollowing;
  late final int totalPosts;
  late final int totalComments;
  late final int totalMirrors;
  late final int totalPublications;
  late final int totalCollects;

  Stats.fromJson(Map<String, dynamic> json) {
    totalFollowers = json['totalFollowers'] ?? 0;
    totalFollowing = json['totalFollowing'] ?? 0;
    totalPosts = json['totalPosts'] ?? 0;
    totalComments = json['totalComments'] ?? 0;
    totalMirrors = json['totalMirrors'] ?? 0;
    totalPublications = json['totalPublications'] ?? 0;
    totalCollects = json['totalCollects'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalFollowers'] = totalFollowers;
    data['totalFollowing'] = totalFollowing;
    data['totalPosts'] = totalPosts;
    data['totalComments'] = totalComments;
    data['totalMirrors'] = totalMirrors;
    data['totalPublications'] = totalPublications;
    data['totalCollects'] = totalCollects;
    return data;
  }
}

class FollowModule {
  FollowModule({
    required this.type,
    required this.recipient,
  });
  late final String type;

  late final String recipient;
  FollowModule.fromJson(Map<String, dynamic> json) {
    type = json['type'];

    recipient = json['recipient'] ?? "";
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;

    data['recipient'] = recipient;
    return data;
  }
}

class Amount {
  Amount({
    required this.asset,
    required this.value,
  });
  late final Asset asset;
  late final String value;
  Amount.fromJson(Map<String, dynamic> json) {
    asset = Asset.fromJson(json['asset']);
    value = json['value'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['asset'] = asset.toJson();
    data['value'] = value;
    return data;
  }
}

class Asset {
  Asset({
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.address,
  });
  late final String name;
  late final String symbol;
  late final int decimals;
  late final String address;
  Asset.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    decimals = json['decimals'];
    address = json['address'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['decimals'] = decimals;
    data['address'] = address;
    return data;
  }
}

class Metadata {
  Metadata({
    required this.name,
    required this.description,
    required this.content,
    required this.media,
    required this.attributes,
  });
  late final String name;
  late final String description;
  late final String content;
  late final List<Media> media;
  late final List<Attributes> attributes;

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'] ?? "";
    content = json['content'];
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['content'] = content;
    data['media'] = media.map((e) => e.toJson()).toList();
    data['attributes'] = attributes.map((e) => e.toJson()).toList();
    return data;
  }
}

class Media {
  Media({
    required this.original,
    this.small,
    this.medium,
  });
  late final Original original;
  late final void small;
  late final void medium;

  Media.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
    small = null;
    medium = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original.toJson();

    return data;
  }
}

class CollectModule {
  CollectModule({
    required this.type,
  });
  late final String type;

  CollectModule.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}
