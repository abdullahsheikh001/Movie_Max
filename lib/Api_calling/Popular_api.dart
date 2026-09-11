import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_max/API_models/Popular_movie_model.dart';
 
class MovieController extends GetxController {
  static const String _apiKey = 'fc33e58a6725938a92c3d7682f88df98';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  var popularMovies = <Movie>[].obs;
  var trendingMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;
  var upcomingMovies = <Movie>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllMovies();
  }

  Future<void> fetchAllMovies() async {
    isLoading.value = true;
    await Future.wait([
      _fetch('movie/popular', popularMovies),
      _fetch('trending/movie/day', trendingMovies),
      _fetch('movie/top_rated', topRatedMovies),
      _fetch('movie/upcoming', upcomingMovies),
    ]);
    isLoading.value = false;
  }

  Future<void> _fetch(String endpoint, RxList<Movie> target) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/$endpoint?api_key=$_apiKey&language=en-US&page=1'),
      );
      if (response.statusCode == 200) {
        final List results = jsonDecode(response.body)['results'];
        target.value = results.map((json) => Movie.fromJson(json)).toList();
      } else {
        Get.log('Failed: $endpoint -> ${response.statusCode}');
      }
    } catch (e) {
      Get.log('Error fetching $endpoint: $e');
    }
  }
}