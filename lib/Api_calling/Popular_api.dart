import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_max/API_models/Popular_movie_model.dart';


class MovieService {
  static const String _apiKey = 'fc33e58a6725938a92c3d7682f88df98';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchPopularMovies() async {
    final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}