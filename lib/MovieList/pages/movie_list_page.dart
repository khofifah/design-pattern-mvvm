import 'package:belajar_flutter/MovieList/view_models/movie_list_view_model.dart';
import 'package:belajar_flutter/MovieList/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataMovie = Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Film'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    dataMovie.fetchMovies(value);
                    controller.clear();
                  }
                },
              ),
            ),
            Expanded(
              child: MovieList(
                movies: dataMovie.movies,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
