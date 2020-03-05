import 'package:flutter/material.dart';
import 'package:the_movie_data_base/models/movie.dart';
import 'package:the_movie_data_base/pages/detail_page.dart';

//
class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        color: Colors.grey[100],
        child: ListTile(
          //
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailPage(movie.id.toString());
              }),
            );
          },
          //
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 300,
              minHeight: 200,
            ),
            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
            ),
          ),

          //
          title: Text(movie.title),
          subtitle: Text(
            movie.releaseDate,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
