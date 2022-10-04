class LensProfile {
  LensProfile({
    required this.data,
  });
  late final LensData data;

  LensProfile.fromJson(Map<String, dynamic> json) {
    data = LensData.fromJson(json['data']);
  }
}

class LensData {
  LensData({
    required this.profile,
  });
  late final Profile profile;

  LensData.fromJson(Map<String, dynamic> json) {
    profile = Profile.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['profile'] = profile.toJson();
    return data;
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
    required this.stats,
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

  late final Stats stats;

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

    stats = Stats.fromJson(json['stats']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['bio'] = bio;
    data['attributes'] = attributes.map((e) => e.toJson()).toList();
    data['followNftAddress'] = followNftAddress;
    data['metadata'] = metadata;
    data['isDefault'] = isDefault;
    data['picture'] = picture.toJson();
    data['handle'] = handle;
    data['coverPicture'] = coverPicture.toJson();
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
    traitType = json['traitType'];
    key = json['key'];
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
    required this.original,
  });
  late final Original original;

  Picture.fromJson(Map<String, dynamic> json) {
    original = Original.fromJson(json['original']);
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
  });
  late final String url;

  Original.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;

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
