import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_data_base/store/app_state.dart';
import 'package:the_movie_data_base/widgets/info_movie.dart';
import 'package:the_movie_data_base/widgets/spin_load.dart';

//
class DetailPage extends StatelessWidget {
  final String movieId;

  DetailPage(this.movieId);

  //
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppState>(context, listen: true);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(2, 2, 20, 2),
            child: Image.asset(
              'assets/logo_tmdb.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: store.loading ? SpinLoading() : InfoMovie(store.theMovie),
    );
  }
}
