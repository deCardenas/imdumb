import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/03_data/models/genres_response.dart';

extension GenreModelMapper on GenreModel {
  Genre toEntity() {
    return Genre(id: id, name: name);
  }
}
