class BaseVideoModel {
  String? videoFileId;
  String? label;
  String? streamKey;
  String? fileType;
  String? fileUrl;
  List<Subtitle>? subtitle;

  BaseVideoModel({
    this.videoFileId,
    this.label,
    this.streamKey,
    this.fileType,
    this.fileUrl,
    this.subtitle,
  });

  BaseVideoModel.fromJson(Map json) {
    videoFileId = json['video_file_id'];
    label = json['label'];
    streamKey = json['stream_key'];
    fileType = json['file_type'];
    fileUrl = json['file_url'];
    subtitle = List.from(json['subtitle']).map((e) => Subtitle.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_file_id'] = videoFileId;
    data['label'] = label;
    data['stream_key'] = streamKey;
    data['file_type'] = fileType;
    data['file_url'] = fileUrl;
    data['subtitle'] = subtitle?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Subtitle {
  Subtitle({
    required this.subtitleId,
    required this.videosId,
    required this.videoFileId,
    required this.language,
    required this.kind,
    required this.url,
    required this.srclang,
  });
  late final String subtitleId;
  late final String videosId;
  late final String videoFileId;
  late final String language;
  late final String kind;
  late final String url;
  late final String srclang;

  Subtitle.fromJson(Map<String, dynamic> json) {
    subtitleId = json['subtitle_id'];
    videosId = json['videos_id'];
    videoFileId = json['video_file_id'];
    language = json['language'];
    kind = json['kind'];
    url = json['url'];
    srclang = json['srclang'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['subtitle_id'] = subtitleId;
    data['videos_id'] = videosId;
    data['video_file_id'] = videoFileId;
    data['language'] = language;
    data['kind'] = kind;
    data['url'] = url;
    data['srclang'] = srclang;
    return data;
  }
}
