import 'dart:convert';

import 'package:belajar_flutter/MovieList/models/movie.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = 'http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body['Search'];
      return json.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Tidak dapat memunculkan');
    }
  }
}
