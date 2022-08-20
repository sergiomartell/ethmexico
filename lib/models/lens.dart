class LensApi {
  LensApi({
    required this.exploreProfiles,
  });
  late final ExploreProfiles exploreProfiles;
  
  LensApi.fromJson(Map<String, dynamic> json){
    exploreProfiles = ExploreProfiles.fromJson(json['exploreProfiles']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['exploreProfiles'] = exploreProfiles.toJson();
    return _data;
  }
}

class ExploreProfiles {
  ExploreProfiles({
    required this.items,
    required this.pageInfo,
  });
  late final List<Items> items;
  late final PageInfo pageInfo;
  
  ExploreProfiles.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
    pageInfo = PageInfo.fromJson(json['pageInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    _data['pageInfo'] = pageInfo.toJson();
    return _data;
  }
}

class Items {
  Items({
    required this.id,
     this.name,
     this.bio,
    required this.isDefault,
    required this.attributes,
    required this.followNftAddress,
     this.metadata,
    required this.handle,
     this.picture,
     this.coverPicture,
    required this.ownedBy,
     this.dispatcher,
    required this.stats,
     this.followModule,
  });
  late final String id;
  late final String? name;
  late final String? bio;
  late final bool isDefault;
  late final List<Attributes> attributes;
  late final String followNftAddress;
  late final String? metadata;
  late final String handle;
  late final Picture? picture;
  late final CoverPicture? coverPicture;
  late final String ownedBy;
  late final Dispatcher? dispatcher;
  late final Stats stats;
  late final FollowModule? followModule;
  
  Items.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = null;
    bio = null;
    isDefault = json['isDefault'];
    attributes = List.from(json['attributes']).map((e)=>Attributes.fromJson(e)).toList();
    followNftAddress = json['followNftAddress'];
    metadata = null;
    handle = json['handle'];
    picture = null;
    coverPicture = null;
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
    _data['isDefault'] = isDefault;
    _data['attributes'] = attributes.map((e)=>e.toJson()).toList();
    _data['followNftAddress'] = followNftAddress;
    _data['metadata'] = metadata;
    _data['handle'] = handle;
    _data['picture'] = picture;
    _data['coverPicture'] = coverPicture;
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
  late final String? displayType;
  late final String traitType;
  late final String key;
  late final String value;
  
  Attributes.fromJson(Map<String, dynamic> json){
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
  
  Picture.fromJson(Map<String, dynamic> json){
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
  
  Original.fromJson(Map<String, dynamic> json){
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
  
  CoverPicture.fromJson(Map<String, dynamic> json){
    original = Original.fromJson(json['original']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['original'] = original.toJson();
    return _data;
  }
}

class Dispatcher {
  Dispatcher({
    required this.address,
    required this.canUseRelay,
  });
  late final String address;
  late final bool canUseRelay;
  
  Dispatcher.fromJson(Map<String, dynamic> json){
    address = json['address'];
    canUseRelay = json['canUseRelay'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['canUseRelay'] = canUseRelay;
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
  
  Stats.fromJson(Map<String, dynamic> json){
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

class FollowModule {
  FollowModule({
    required this.type,
    required this.contractAddress,
    required this.amount,
    required this.recipient,
  });
  late final String type;
  late final String contractAddress;
  late final Amount amount;
  late final String recipient;
  
  FollowModule.fromJson(Map<String, dynamic> json){
    type = json['type'];
    contractAddress = json['contractAddress'];
    amount = Amount.fromJson(json['amount']);
    recipient = json['recipient'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['contractAddress'] = contractAddress;
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
  
  Amount.fromJson(Map<String, dynamic> json){
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
  
  Asset.fromJson(Map<String, dynamic> json){
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

class PageInfo {
  PageInfo({
    required this.prev,
    required this.next,
    required this.totalCount,
  });
  late final String prev;
  late final String next;
  late final int totalCount;
  
  PageInfo.fromJson(Map<String, dynamic> json){
    prev = json['prev'];
    next = json['next'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['prev'] = prev;
    _data['next'] = next;
    _data['totalCount'] = totalCount;
    return _data;
  }
}