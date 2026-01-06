import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/03_data/models/images_response.dart';

extension ImagesResponseMapper on ImagesResponse {
  ImagesResponseEntity toEntity() {
    return ImagesResponseEntity(
      id: id,
      backdrops: backdrops?.map((e) => e.toEntity()).toList(),
      logos: logos?.map((e) => e.toEntity()).toList(),
      posters: posters?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension TMDBImageMapper on TMDBImageModel {
  TMDBImageEntity toEntity() {
    return TMDBImageEntity(
      aspectRatio: aspectRatio,
      filePath: filePath,
      height: height,
      iso6391: iso6391,
      voteAverage: voteAverage,
      voteCount: voteCount,
      width: width,
    );
  }
}
