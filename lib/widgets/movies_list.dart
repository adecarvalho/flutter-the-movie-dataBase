import 'package:flutter/material.dart';
import 'package:the_movie_data_base/models/movie.dart';
import 'package:the_movie_data_base/store/app_state.dart';
import 'package:the_movie_data_base/widgets/card_for_movie.dart';
import 'package:the_movie_data_base/widgets/movie_card.dart';
//

class MoviesList extends StatelessWidget {
  //final List<Movie> themovies;
  final AppState store;
  //
  MoviesList(this.store);

  @override
  Widget build(BuildContext context) {
    final _movies = store.movies;
    //
    if (_movies.length > 0) {
      return Expanded(
        child: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final item = _movies[index];
            return CardForMovie(
              movie: item,
              getMovieHandler: store.findMovieById,
            );
            //return MovieCard(item);
          },
        ),
      );
    }
    return Container();
  }
}
