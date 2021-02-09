import 'package:belajar_flutter/MovieList/view_models/movie_view_model.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return ListTile(
          contentPadding: EdgeInsets.all(5),
          title: Text(movie.title),
          leading: Container(
            width: 50,
            height: 100,
            child: Image.network(movie.poster),
          ),
        );
      },
    );
  }
}
