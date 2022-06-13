class SearchResponse {
  List<PhotoItem>? data;
  Pagination? pagination;
  Meta? meta;

  SearchResponse({this.data, this.pagination, this.meta});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PhotoItem>[];
      json['data'].forEach((v) {
        data!.add(PhotoItem.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class PhotoItem {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  List<String>? tags;
  List<String>? featuredTags;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String? importDatetime;
  String? trendingDatetime;
  String? createDatetime;
  String? updateDatetime;
  Images? images;
  User? user;

  PhotoItem(
      {this.type,
        this.id,
        this.url,
        this.slug,
        this.bitlyGifUrl,
        this.bitlyUrl,
        this.embedUrl,
        this.username,
        this.source,
        this.title,
        this.rating,
        this.contentUrl,
        this.tags,
        this.featuredTags,
        this.sourceTld,
        this.sourcePostUrl,
        this.isSticker,
        this.importDatetime,
        this.trendingDatetime,
        this.createDatetime,
        this.updateDatetime,
        this.images,
        this.user,
      });

  PhotoItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    source = json['source'];
    title = json['title'];
    rating = json['rating'];
    contentUrl = json['content_url'];
    tags = json['tags'].cast<String>();
    featuredTags = json['featured_tags'].cast<String>();
    sourceTld = json['source_tld'];
    sourcePostUrl = json['source_post_url'];
    isSticker = json['is_sticker'];
    importDatetime = json['import_datetime'];
    trendingDatetime = json['trending_datetime'];
    createDatetime = json['create_datetime'];
    updateDatetime = json['update_datetime'];
    images =
    json['images'] != null ? Images.fromJson(json['images']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['url'] = url;
    data['slug'] = slug;
    data['bitly_gif_url'] = bitlyGifUrl;
    data['bitly_url'] = bitlyUrl;
    data['embed_url'] = embedUrl;
    data['username'] = username;
    data['source'] = source;
    data['title'] = title;
    data['rating'] = rating;
    data['content_url'] = contentUrl;
    data['tags'] = tags;
    data['featured_tags'] = featuredTags;
    data['source_tld'] = sourceTld;
    data['source_post_url'] = sourcePostUrl;
    data['is_sticker'] = isSticker;
    data['import_datetime'] = importDatetime;
    data['trending_datetime'] = trendingDatetime;
    data['create_datetime'] = createDatetime;
    data['update_datetime'] = updateDatetime;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Images {
  Original? original;
  Original? downsized;
  Original? still;

  Images({this.original, this.downsized});

  Images.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(json['original'])
        : null;
    downsized = json['downsized_medium'] != null
        ? Original.fromJson(json['downsized_medium'])
        : null;
    still = json['downsized_still'] != null
        ? Original.fromJson(json['downsized_still'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (original != null) {
      data['original'] = original!.toJson();
    }
    return data;
  }
}

class Original {
  int? height;
  int? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  Original(
      {this.height,
        this.width,
        this.size,
        this.url,
        this.mp4Size,
        this.mp4,
        this.webpSize,
        this.webp,
        this.frames,
        this.hash});

  Original.fromJson(Map<String, dynamic> json) {
    height = int.parse(json['height']);
    width = int.parse(json['width']);
    size = json['size'];
    url = json['url'];
    mp4Size = json['mp4_size'];
    mp4 = json['mp4'];
    webpSize = json['webp_size'];
    webp = json['webp'];
    frames = json['frames'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['size'] = size;
    data['url'] = url;
    data['mp4_size'] = mp4Size;
    data['mp4'] = mp4;
    data['webp_size'] = webpSize;
    data['webp'] = webp;
    data['frames'] = frames;
    data['hash'] = hash;
    return data;
  }
}

class Looping {
  String? mp4Size;
  String? mp4;

  Looping({this.mp4Size, this.mp4});

  Looping.fromJson(Map<String, dynamic> json) {
    mp4Size = json['mp4_size'];
    mp4 = json['mp4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mp4_size'] = mp4Size;
    data['mp4'] = mp4;
    return data;
  }
}

class User {
  String? avatarUrl;
  String? bannerImage;
  String? bannerUrl;
  String? profileUrl;
  String? username;
  String? displayName;
  String? description;
  String? instagramUrl;
  String? websiteUrl;
  bool? isVerified;

  User(
      {this.avatarUrl,
        this.bannerImage,
        this.bannerUrl,
        this.profileUrl,
        this.username,
        this.displayName,
        this.description,
        this.instagramUrl,
        this.websiteUrl,
        this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    bannerImage = json['banner_image'];
    bannerUrl = json['banner_url'];
    profileUrl = json['profile_url'];
    username = json['username'];
    displayName = json['display_name'];
    description = json['description'];
    instagramUrl = json['instagram_url'];
    websiteUrl = json['website_url'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar_url'] = avatarUrl;
    data['banner_image'] = bannerImage;
    data['banner_url'] = bannerUrl;
    data['profile_url'] = profileUrl;
    data['username'] = username;
    data['display_name'] = displayName;
    data['description'] = description;
    data['instagram_url'] = instagramUrl;
    data['website_url'] = websiteUrl;
    data['is_verified'] = isVerified;
    return data;
  }
}

class Analytics {
  Onload? onload;
  Onload? onclick;
  Onload? onsent;

  Analytics({this.onload, this.onclick, this.onsent});

  Analytics.fromJson(Map<String, dynamic> json) {
    onload =
    json['onload'] != null ? Onload.fromJson(json['onload']) : null;
    onclick =
    json['onclick'] != null ? Onload.fromJson(json['onclick']) : null;
    onsent =
    json['onsent'] != null ? Onload.fromJson(json['onsent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onload != null) {
      data['onload'] = onload!.toJson();
    }
    if (onclick != null) {
      data['onclick'] = onclick!.toJson();
    }
    if (onsent != null) {
      data['onsent'] = onsent!.toJson();
    }
    return data;
  }
}

class Onload {
  String? url;

  Onload({this.url});

  Onload.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Pagination {
  int? totalCount;
  int? count;
  int? offset;

  Pagination({this.totalCount, this.count, this.offset});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    count = json['count'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['count'] = count;
    data['offset'] = offset;
    return data;
  }
}

class Meta {
  int? status;
  String? msg;
  String? responseId;

  Meta({this.status, this.msg, this.responseId});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    responseId = json['response_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['response_id'] = responseId;
    return data;
  }
}