class LensPublications {
  LensPublications({
    required this.id,
    required this.profile,
    required this.stats,
    required this.metadata,
    required this.createdAt,
    required this.collectModule,
    this.referenceModule,
    required this.appId,
    required this.hidden,
    this.reaction,
    required this.hasCollectedByMe,
  });
  late final String id;
  late final Profile profile;
  late final Stats stats;
  late final Metadata metadata;
  late final String createdAt;
  late final CollectModule collectModule;
  late final Null referenceModule;
  late final String appId;
  late final bool hidden;
  late final Null reaction;
  late final bool hasCollectedByMe;

  LensPublications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = Profile.fromJson(json['profile']);
    stats = Stats.fromJson(json['stats']);
    metadata = Metadata.fromJson(json['metadata']);
    createdAt = json['createdAt'];
    collectModule = CollectModule.fromJson(json['collectModule']);
    referenceModule = null;
    appId = json['appId'] ?? "";
    hidden = json['hidden'];
    reaction = null;
    hasCollectedByMe = json['hasCollectedByMe'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profile'] = profile.toJson();
    _data['stats'] = stats.toJson();
    _data['metadata'] = metadata.toJson();
    _data['createdAt'] = createdAt;
    _data['collectModule'] = collectModule.toJson();
    _data['referenceModule'] = referenceModule;
    _data['appId'] = appId;
    _data['hidden'] = hidden;
    _data['reaction'] = reaction;

    _data['hasCollectedByMe'] = hasCollectedByMe;
    return _data;
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
    this.picture,
    this.coverPicture,
    required this.ownedBy,
    this.dispatcher,
    required this.stats,
    this.followModule,
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
  late final picture;
  late final coverPicture;
  late final String ownedBy;
  late final dispatcher;
  late final Stats stats;
  late final followModule;

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
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    coverPicture = json['coverPicture'] != null
        ? CoverPicture.fromJson(json['coverPicture'])
        : null;
    ownedBy = json['ownedBy'];
    dispatcher = json['dispatcher'] != null
        ? Dispatcher.fromJson(json['dispatcher'])
        : null;
    stats = Stats.fromJson(json['stats']);
    followModule = json['followModule'] != null
        ? FollowModule.fromJson(json['followModule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['bio'] = bio;
    _data['isFollowedByMe'] = isFollowedByMe;
    _data['isFollowing'] = isFollowing;
    _data['followNftAddress'] = followNftAddress;
    _data['metadata'] = metadata;
    _data['isDefault'] = isDefault;
    _data['handle'] = handle;
    _data['picture'] = picture.toJson();
    _data['coverPicture'] = coverPicture.toJson();
    _data['ownedBy'] = ownedBy;
    _data['dispatcher'] = dispatcher.toJson();
    _data['stats'] = stats.toJson();
    if (this.followModule != null) {
      _data['followModule'] = followModule.toJson();
    }
    ;
    return _data;
  }
}

class Attributes {
  Attributes({
    this.displayType,
    required this.traitType,
    required this.key,
    required this.value,
  });
  late final Null displayType;
  late final String traitType;
  late final String key;
  late final String value;

  Attributes.fromJson(Map<String, dynamic> json) {
    displayType = null;
    traitType = json['traitType'] ?? "";
    key = json['key'] ?? "";
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['displayType'] = displayType;
    _data['traitType'] = traitType;
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}

class Picture {
  Picture({
    this.original,
    this.small,
    this.medium,
  });
  late final original;
  late final Null small;
  late final Null medium;

  Picture.fromJson(Map<String, dynamic> json) {
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;
    small = null;
    medium = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
    _data['small'] = small;
    _data['medium'] = medium;
    return _data;
  }
}

class Original {
  Original({
    required this.url,
    this.width,
    this.height,
    this.mimeType,
  });
  late final String url;
  late final Null width;
  late final Null height;
  late final mimeType;

  Original.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = null;
    height = null;
    mimeType = json['mimeType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    _data['mimeType'] = mimeType;
    return _data;
  }
}

class CoverPicture {
  CoverPicture({
    required this.original,
    this.small,
    this.medium,
  });
  late final Original original;
  late final Null small;
  late final Null medium;

  CoverPicture.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
    small = null;
    medium = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
    _data['small'] = small;
    _data['medium'] = medium;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['address'] = address;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['totalFollowers'] = totalFollowers;
    _data['totalFollowing'] = totalFollowing;
    _data['totalPosts'] = totalPosts;
    _data['totalComments'] = totalComments;
    _data['totalMirrors'] = totalMirrors;
    _data['totalPublications'] = totalPublications;
    _data['totalCollects'] = totalCollects;
    return _data;
  }
}

class FollowModule {
  FollowModule({
    required this.type,
    this.amount,
    required this.recipient,
  });
  late final String type;
  late final amount;
  late final String recipient;
  FollowModule.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    amount = json['amount'] != null ? Amount.fromJson(json['amount']) : null;
    recipient = json['recipient'] ?? "";
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['amount'] = amount.toJson();
    _data['recipient'] = recipient;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['asset'] = asset.toJson();
    _data['value'] = value;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['symbol'] = symbol;
    _data['decimals'] = decimals;
    _data['address'] = address;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['content'] = content;
    _data['media'] = media.map((e) => e.toJson()).toList();
    _data['attributes'] = attributes.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Media {
  Media({
    required this.original,
    this.small,
    this.medium,
  });
  late final Original original;
  late final Null small;
  late final Null medium;

  Media.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
    small = null;
    medium = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
    _data['small'] = small;
    _data['medium'] = medium;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['type'] = type;
    return _data;
  }
}
