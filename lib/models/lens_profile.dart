class LensProfileData {
  LensProfileData({
    required this.data,
  });
  late final LensData data;

  LensProfileData.fromJson(Map<String, dynamic>? json) {
    data = LensData.fromJson(json?['data']);
  }
}

class LensData {
  LensData({
    required this.profile,
  });
  late final ProfileData profile;

  LensData.fromJson(Map<String, dynamic> json) {
    profile = ProfileData.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['profile'] = profile.toJson();
    return data;
  }
}

class ProfileData {
  ProfileData({
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
  late final List<ProfileAttributes> attributes;
  late final String followNftAddress;
  late final String metadata;
  late final bool isDefault;
  late final ProfilePicture picture;
  late final String handle;
  late final ProfileCoverPicture coverPicture;
  late final String ownedBy;

  late final ProfileStats stats;

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    bio = json['bio'] ?? "";
    /*  attributes = List.from(json['attributes'])
        .map((e) => ProfileAttributes.fromJson(e))
        .toList(); */
    followNftAddress = json['followNftAddress'] ?? "";
    metadata = json['metadata'] ?? "";
    isDefault = json['isDefault'] ?? true;
    //picture = ProfilePicture.fromJson(json['picture']);
    handle = json['handle'] ?? "";
    //coverPicture = ProfileCoverPicture.fromJson(json['coverPicture']);
    ownedBy = json['ownedBy'] ?? "";

    //stats = ProfileStats.fromJson(json['stats']);
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

class ProfileAttributes {
  ProfileAttributes({
    required this.traitType,
    required this.key,
    required this.value,
  });

  late final String traitType;
  late final String key;
  late final String value;

  ProfileAttributes.fromJson(Map<String, dynamic> json) {
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

class ProfilePicture {
  ProfilePicture({
    required this.original,
  });
  late final ProfileOriginal original;

  ProfilePicture.fromJson(Map<String, dynamic> json) {
    original = ProfileOriginal.fromJson(json['original']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original.toJson();

    return data;
  }
}

class ProfileOriginal {
  ProfileOriginal({
    required this.url,
  });
  late final String url;

  ProfileOriginal.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;

    return data;
  }
}

class ProfileCoverPicture {
  ProfileCoverPicture({
    required this.original,
  });
  late final ProfileOriginal original;

  ProfileCoverPicture.fromJson(Map<String, dynamic> json) {
    original = ProfileOriginal.fromJson(json['original']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original.toJson();

    return data;
  }
}

class ProfileStats {
  ProfileStats({
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

  ProfileStats.fromJson(Map<String, dynamic> json) {
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
