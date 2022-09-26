class LensProfile {
  LensProfile({
    required this.data,
  });
  late final Data data;

  LensProfile.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.profile,
  });
  late final Profile profile;

  Data.fromJson(Map<String, dynamic> json) {
    profile = Profile.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profile'] = profile.toJson();
    return _data;
  }
}

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.bio,
    required this.attributes,
    required this.followNftAddress,
    required this.metadata,
    required this.isDefault,
    required this.picture,
    required this.handle,
    required this.coverPicture,
    required this.ownedBy,
    this.dispatcher,
    required this.stats,
    this.followModule,
  });
  late final String id;
  late final String name;
  late final String bio;
  late final List<Attributes> attributes;
  late final String followNftAddress;
  late final String metadata;
  late final bool isDefault;
  late final Picture picture;
  late final String handle;
  late final CoverPicture coverPicture;
  late final String ownedBy;
  late final Null dispatcher;
  late final Stats stats;
  late final Null followModule;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
    followNftAddress = json['followNftAddress'];
    metadata = json['metadata'];
    isDefault = json['isDefault'];
    picture = Picture.fromJson(json['picture']);
    handle = json['handle'];
    coverPicture = CoverPicture.fromJson(json['coverPicture']);
    ownedBy = json['ownedBy'];
    dispatcher = null;
    stats = Stats.fromJson(json['stats']);
    followModule = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['bio'] = bio;
    _data['attributes'] = attributes.map((e) => e.toJson()).toList();
    _data['followNftAddress'] = followNftAddress;
    _data['metadata'] = metadata;
    _data['isDefault'] = isDefault;
    _data['picture'] = picture.toJson();
    _data['handle'] = handle;
    _data['coverPicture'] = coverPicture.toJson();
    _data['ownedBy'] = ownedBy;
    _data['dispatcher'] = dispatcher;
    _data['stats'] = stats.toJson();
    _data['followModule'] = followModule;
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
    traitType = json['traitType'];
    key = json['key'];
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
    required this.original,
  });
  late final Original original;

  Picture.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
    return _data;
  }
}

class Original {
  Original({
    required this.url,
    this.mimeType,
  });
  late final String url;
  late final Null mimeType;

  Original.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    mimeType = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['mimeType'] = mimeType;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
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
    totalFollowers = json['totalFollowers'];
    totalFollowing = json['totalFollowing'];
    totalPosts = json['totalPosts'];
    totalComments = json['totalComments'];
    totalMirrors = json['totalMirrors'];
    totalPublications = json['totalPublications'];
    totalCollects = json['totalCollects'];
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
