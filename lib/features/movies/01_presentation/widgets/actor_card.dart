import 'package:flutter/material.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/image_wrapper.dart';
import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';

class ActorCard extends StatelessWidget {
  final PersonEntity actor;
  const ActorCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.0),
            child: ImageWrapper(
              url: ApiConstants.theMovieDbImageBaseUrl,
              imagePath: actor.profilePath,
              defaultIcon: Icons.person_outline,
              height: 200,
            ),
          ),
          Text(actor.name ?? '-', maxLines: 2),
          Text(actor.character ?? '-', maxLines: 2),
        ],
      ),
    );
  }
}
