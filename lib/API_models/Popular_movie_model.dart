// ignore: file_names
class Movie {
  final int id;
  final String title;
  final String fullPosterUrl;
  final double voteAverage;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.fullPosterUrl,
    required this.voteAverage,
    required this.overview,
  });

   factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'],
    title: json['title'] ?? '',
    fullPosterUrl: json['poster_path'] != null
        ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
        : '',
    voteAverage: (json['vote_average'] ?? 0).toDouble(),
    overview: json['overview'] ?? '',
  );
}
}