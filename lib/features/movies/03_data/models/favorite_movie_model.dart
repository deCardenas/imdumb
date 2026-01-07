import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class FavoriteMovieHiveModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String? posterPath;

  @HiveField(4)
  final double voteAverage;

  @HiveField(5)
  final int voteCount;

  @HiveField(6)
  final String releaseDate;

  FavoriteMovieHiveModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });
}

class FavoriteMovieHiveModelAdapter
    extends TypeAdapter<FavoriteMovieHiveModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteMovieHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return FavoriteMovieHiveModel(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      overview: fields[3] as String,
      voteAverage: fields[4] as double,
      voteCount: fields[5] as int,
      releaseDate: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteMovieHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.voteCount)
      ..writeByte(6)
      ..write(obj.releaseDate);
  }
}
