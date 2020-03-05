import 'package:flutter/material.dart';
import 'package:the_movie_data_base/models/movie.dart';
import 'package:the_movie_data_base/pages/detail_page.dart';
import 'package:the_movie_data_base/store/app_state.dart';

//
class CardForMovie extends StatelessWidget {
  final Function getMovieHandler;
  final Movie movie;

//
  CardForMovie({this.movie, this.getMovieHandler});
  //
  String _dateMiseEnForm() {
    String res = movie.releaseDate.toString();

    List<String> tab = res.split('-');

    return ('${tab[2]}-${tab[1]}-${tab[0]}');
  }

  //
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        splashColor: Colors.teal.withAlpha(60),
        onTap: () {
          //
          //store.findMovieById(movie.id);
          getMovieHandler(movie.id);
          //
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DetailPage(movie.id);
            }),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movie.posterUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //
            Container(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //overview
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                      child: Text(
                        movie.overview,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //date
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Date de sortie: ${_dateMiseEnForm()}',
                        //'Date: ${movie.releaseDate}',
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
