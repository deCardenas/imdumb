final class ImagesResponse {
  final int? id;
  final List<TMDBImageModel>? backdrops;
  final List<TMDBImageModel>? logos;
  final List<TMDBImageModel>? posters;

  const ImagesResponse({this.id, this.backdrops, this.logos, this.posters});

  factory ImagesResponse.fromJson(Map<String, dynamic> json) => ImagesResponse(
    id: json['id'] as int?,
    backdrops: (json['backdrops'] as List<dynamic>?)
        ?.map((e) => TMDBImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    logos: (json['logos'] as List<dynamic>?)
        ?.map((e) => TMDBImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    posters: (json['posters'] as List<dynamic>?)
        ?.map((e) => TMDBImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'backdrops': backdrops?.map((e) => e.toJson()).toList(),
    'logos': logos?.map((e) => e.toJson()).toList(),
    'posters': posters?.map((e) => e.toJson()).toList(),
  };
}

final class TMDBImageModel {
  final double? aspectRatio;
  final int? height;
  final String? iso31661;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const TMDBImageModel({
    this.aspectRatio,
    this.height,
    this.iso31661,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory TMDBImageModel.fromJson(Map<String, dynamic> json) => TMDBImageModel(
    aspectRatio: json['aspect_ratio'] as double?,
    height: json['height'] as int?,
    iso31661: json['iso_3166_1'] as String?,
    iso6391: json['iso_639_1'] as String?,
    filePath: json['file_path'] as String?,
    voteAverage: json['vote_average'] as double?,
    voteCount: json['vote_count'] as int?,
    width: json['width'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'aspect_ratio': aspectRatio,
    'height': height,
    'iso_3166_1': iso31661,
    'iso_639_1': iso6391,
    'file_path': filePath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'width': width,
  };
}
