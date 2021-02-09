import 'package:belajar_flutter/MovieList/view_models/movie_view_model.dart';
import 'package:belajar_flutter/services/webservice.dart';
import 'package:flutter/material.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(String keyword) async {
    final result = await WebService().fetchMovies(keyword);
    this.movies = result.map((e) => MovieViewModel(movie: e)).toList();
    notifyListeners();
  }
}
