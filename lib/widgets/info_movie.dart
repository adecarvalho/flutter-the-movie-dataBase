import 'package:flutter/material.dart';
import 'package:the_movie_data_base/models/movie.dart';
import 'package:the_movie_data_base/widgets/casting_list.dart';

//
class InfoMovie extends StatelessWidget {
  final Movie _movie;

  InfoMovie(this._movie);
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //les infos
        Container(
          height: MediaQuery.of(context).size.height - 350,
          child: AfficheLesInfos(_movie),
        ),
        //le casting
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: CastingList(_movie.cast),
        ),
      ],
    );
  }
}

//***************************************** */
class AfficheLesInfos extends StatelessWidget {
  final Movie _movie;

  AfficheLesInfos(this._movie);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //image
            Container(
              child: Image.network(
                _movie.backdropUrl,
                fit: BoxFit.cover,
              ),
            ),
            //title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            //overview
            Text(_movie.overview),
            //date
            AfficheDate(_movie.releaseDate),
            //
            SizedBox(
              height: 10,
            ),
            //vote et durée
            AfficheVoteDuree(_movie),
            //les genres
            AfficheGenres(_movie.genres),
            //realisateur
            AfficheRealisateur(_movie.director),
            //
            AfficheWriter(_movie.screenplay),
            //fin widgets
          ],
        ),
        //
      ),
    );
  }
}

//**************************************** */
class AfficheWriter extends StatelessWidget {
  final List _writer;

  AfficheWriter(this._writer);
  //
  String _miseEnform() {
    String res = '';

    for (var item in _writer) {
      if (item['job'] == 'Writer') {
        res += item['name'];
        res += '\n';
      }
    }

    return res;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Scénario:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              _miseEnform(),
            ),
          ),
        ],
      ),
    );
  }
}

//*************************************** */
class AfficheGenres extends StatelessWidget {
  final List _genres;
  AfficheGenres(this._genres);

  String _miseEnForm() {
    String res = '';
    for (var item in _genres) {
      res += item;
      res += ' ';
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Genres: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          Expanded(
            child: Text(
              _miseEnForm(),
            ),
          ),
        ],
      ),
    );
  }
}

//*************************** *****************/
class AfficheRealisateur extends StatelessWidget {
  final List _director;

  AfficheRealisateur(this._director);

  String _miseEnforme() {
    String res = '';

    for (var item in _director) {
      res += item;
    }

    return res;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Réalisation: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              _miseEnforme(),
            ),
          ),
        ],
      ),
    );
  }
}

//***************************************** */
class AfficheVoteDuree extends StatelessWidget {
  final Movie _movie;
  //
  AfficheVoteDuree(this._movie);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Vote: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${_movie.voteAverage}'),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Durée du film: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${_movie.runtime} minutes'),
          ],
        ),
      ],
    );
  }
}

//*********************************** */
class AfficheDate extends StatelessWidget {
  final String _date;

  AfficheDate(this._date);

  String _miseEnforme() {
    String res = '';

    List<String> tab = _date.split('-');
    res = '${tab[2]}-${tab[1]}-${tab[0]}';

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Sortie le: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          Text(
            '${_miseEnforme()}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
