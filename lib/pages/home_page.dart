import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_data_base/store/app_state.dart';
import 'package:the_movie_data_base/widgets/movies_list.dart';
import 'package:the_movie_data_base/widgets/search.dart';
import 'package:the_movie_data_base/widgets/spin_load.dart';

//
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool istoggle = true;

  @override
  void initState() {
    istoggle = true;
    super.initState();
  }

  void _toggle() {
    setState(() {
      istoggle = !istoggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    final store = Provider.of<AppState>(context, listen: true);

    //
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
          child: Image.asset(
            'assets/logo_tmdb.png',
            fit: BoxFit.contain,
          ),
        ),
        title: Text('TMDB'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _toggle();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //
          istoggle ? Search() : Container(),
          //
          store.loading ? SpinLoading() : MoviesList(store) ?? [],
          //
        ],
      ),
    );
  }
}
