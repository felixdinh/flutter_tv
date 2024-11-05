import 'package:test_tv/video/models/base_video.dart';


class VideoModel extends BaseVideoModel {
  String? videosId;
  String? title;
  String? description;
  String? slug;
  String? release;
  String? runtime;
  String? videoQuality;
  String? isTvseries;
  String? isPaid;
  bool enableDownload = false;
  String? thumbnailUrl;
  String? posterUrl;
  List<Genre> genre = [];
  List<Country> country = [];
  List<Director> director = [];
  List<Writer> writer = [];
  List<Cast> cast = [];
  List<CastAndCrew> castAndCrew = [];
  List<Season> season = [];
  List<RelatedItem> relatedList = [];

  Duration? position;
  Duration? duration;
  String? curUrl;
  Season? curSeason;
  Episodes? curEpisode;
  String? _relateKey;

  VideoModel({
    this.videosId,
    this.title,
    this.description,
    this.slug,
    this.release,
    this.runtime,
    this.videoQuality,
    this.isTvseries,
    this.isPaid,
    this.enableDownload = false,
    this.thumbnailUrl,
    this.posterUrl,
    this.genre = const [],
    this.country = const [],
    this.director = const [],
    this.writer = const [],
    this.cast = const [],
    this.castAndCrew = const [],
    this.season = const [],
    this.relatedList = const [],
    this.position,
    this.duration,
    this.curUrl,
  });

  VideoModel.fromJson(Map json, {required String relateKey}) {
    duration = Duration(milliseconds: json['duration'] ?? 0);
    position = Duration(milliseconds: json['position'] ?? 0);
    curUrl = json['curUrl'];
    if (json['curSeason'] != null) {
      curSeason = Season.fromJson(json['curSeason']);
    }
    if (json['curSeason'] != null) {
      curEpisode = Episodes.fromJson(json['curEpisode']);
    }

    videosId = json['videos_id'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    release = json['release'];
    runtime = json['runtime'];
    videoQuality = json['video_quality'];
    isTvseries = json['is_tvseries'];
    isPaid = json['is_paid'];
    enableDownload = json['enable_download'];
    thumbnailUrl = json['thumbnail_url'];
    posterUrl = json['poster_url'];
    if (json['genre'] != null) {
      var jsonList = json['genre'] as List;
      jsonList.map((e) => Genre.fromJson(e)).toList().forEach((element) {
        genre.add(element);
      });
    }
    if (json['country'] != null) {
      var jsonList = json['country'] as List;
      jsonList.map((e) => Country.fromJson(e)).toList().forEach((element) {
        country.add(element);
      });
    }
    if (json['director'] != null) {
      var jsonList = json['director'] as List;
      jsonList.map((e) => Director.fromJson(e)).toList().forEach((element) {
        director.add(element);
      });
    }
    if (json['writer'] != null) {
      var jsonList = json['writer'] as List;
      jsonList.map((e) => Writer.fromJson(e)).toList().forEach((element) {
        writer.add(element);
      });
    }
    if (json['cast'] != null) {
      var jsonList = json['cast'] as List;
      jsonList.map((e) => Cast.fromJson(e)).toList().forEach((element) {
        cast.add(element);
      });
    }
    if (json['cast_and_crew'] != null) {
      var jsonList = json['cast_and_crew'] as List;
      jsonList.map((e) => CastAndCrew.fromJson(e)).toList().forEach((element) {
        castAndCrew.add(element);
      });
    }
    if (json['season'] != null) {
      var jsonList = json['season'] as List;
      jsonList.map((e) => Season.fromJson(e)).toList().forEach((element) {
        season.add(element);
      });
    }
    _relateKey = relateKey;
    if (json[_relateKey] != null) {
      var jsonList = json[_relateKey] as List;
      jsonList.map((e) => RelatedItem.fromJson(e)).toList().forEach((element) {
        relatedList.add(element);
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['position'] = position?.inMilliseconds;
    data['duration'] = duration?.inMilliseconds;
    data['curUrl'] = curUrl;
    data['curSeason'] = curSeason?.toJson();
    data['curEpisode'] = curEpisode?.toJson();

    data['videos_id'] = videosId;
    data['title'] = title;
    data['description'] = description;
    data['slug'] = slug;
    data['release'] = release;
    data['runtime'] = runtime;
    data['video_quality'] = videoQuality;
    data['is_tvseries'] = isTvseries;
    data['is_paid'] = isPaid;
    data['enable_download'] = enableDownload;
    data['thumbnail_url'] = thumbnailUrl;
    data['poster_url'] = posterUrl;
    data['genre'] = genre.map((v) => v.toJson()).toList();
    data['country'] = country.map((v) => v.toJson()).toList();
    data['director'] = director.map((v) => v.toJson()).toList();
    data['writer'] = writer.map((v) => v.toJson()).toList();
    data['cast'] = cast.map((v) => v.toJson()).toList();
    data['cast_and_crew'] = castAndCrew.map((v) => v.toJson()).toList();
    data['season'] = season.map((v) => v.toJson()).toList();
    if (_relateKey != null) {
      data[_relateKey!] = relatedList.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Genre {
  String? genreId;
  String? name;
  String? url;

  Genre({this.genreId, this.name, this.url});

  Genre.fromJson(Map json) {
    genreId = json['genre_id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genre_id'] = genreId;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Country {
  String? countryId;
  String? name;
  String? url;

  Country({this.countryId, this.name, this.url});

  Country.fromJson(Map json) {
    countryId = json['country_id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Writer {
  String? starId;
  String? name;
  String? url;
  String? imageUrl;

  Writer({this.starId, this.name, this.url, this.imageUrl});

  Writer.fromJson(Map json) {
    starId = json['star_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star_id'] = starId;
    data['name'] = name;
    data['url'] = url;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Cast {
  String? starId;
  String? name;
  String? url;
  String? imageUrl;

  Cast({this.starId, this.name, this.url, this.imageUrl});

  Cast.fromJson(Map json) {
    starId = json['star_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star_id'] = starId;
    data['name'] = name;
    data['url'] = url;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Season {
  final String? seasonsId;
  final String? seasonsName;
  final List<Episodes> episodes;

  Season({this.seasonsId, this.seasonsName, this.episodes = const []});

  factory Season.fromJson(Map json) => Season(
    seasonsId: json['seasons_id'],
    seasonsName: json['seasons_name'],
    episodes: json['episodes']  == null ? [] : List<Episodes>.from(json['episodes'].map((e) => Episodes.fromJson(e))),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seasons_id'] = seasonsId;
    data['seasons_name'] = seasonsName;
    data['episodes'] = episodes.map((v) => v.toJson()).toList();
      return data;
  }
}

class CastAndCrew {
  String? starId;
  String? name;
  String? url;
  String? imageUrl;

  CastAndCrew({this.starId, this.name, this.url, this.imageUrl});

  CastAndCrew.fromJson(Map json) {
    starId = json['star_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star_id'] = starId;
    data['name'] = name;
    data['url'] = url;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Episodes {
  String? episodesId;
  String? episodesName;
  String? streamKey;
  String? fileType;
  String? imageUrl;
  String? fileUrl;
  List<Subtitle>? subtitle;

  Episodes({this.episodesId, this.episodesName, this.streamKey, this.fileType, this.imageUrl, this.fileUrl, this.subtitle});

  Episodes.fromJson(Map json) {
    episodesId = json['episodes_id'];
    episodesName = json['episodes_name'];
    streamKey = json['stream_key'];
    fileType = json['file_type'];
    imageUrl = json['image_url'];
    fileUrl = json['file_url'];
    subtitle = List.from(json['subtitle']).map((e) => Subtitle.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['episodes_id'] = episodesId;
    data['episodes_name'] = episodesName;
    data['stream_key'] = streamKey;
    data['file_type'] = fileType;
    data['image_url'] = imageUrl;
    data['file_url'] = fileUrl;
    data['subtitle'] = subtitle != null ? subtitle!.map((e) => e.toJson()).toList() : null;
    return data;
  }
}

class Director {
  String? starId;
  String? name;
  String? url;
  String? imageUrl;

  Director({this.starId, this.name, this.url, this.imageUrl});

  Director.fromJson(Map json) {
    starId = json['star_id'];
    name = json['name'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star_id'] = starId;
    data['name'] = name;
    data['url'] = url;
    data['image_url'] = imageUrl;
    return data;
  }
}

class RelatedItem {
  String? videosId;
  String? genre;
  String? country;
  String? title;
  String? description;
  String? slug;
  String? release;
  String? runtime;
  String? videoQuality;
  String? thumbnailUrl;
  String? posterUrl;

  RelatedItem(
      {this.videosId,
        this.genre,
        this.country,
        this.title,
        this.description,
        this.slug,
        this.release,
        this.runtime,
        this.videoQuality,
        this.thumbnailUrl,
        this.posterUrl});

  RelatedItem.fromJson(Map json) {
    videosId = json['videos_id'];
    genre = json['genre'];
    country = json['country'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    release = json['release'];
    runtime = json['runtime'];
    videoQuality = json['video_quality'];
    thumbnailUrl = json['thumbnail_url'];
    posterUrl = json['poster_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videos_id'] = videosId;
    data['genre'] = genre;
    data['country'] = country;
    data['title'] = title;
    data['description'] = description;
    data['slug'] = slug;
    data['release'] = release;
    data['runtime'] = runtime;
    data['video_quality'] = videoQuality;
    data['thumbnail_url'] = thumbnailUrl;
    data['poster_url'] = posterUrl;
    return data;
  }
}
