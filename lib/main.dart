import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_data_base/pages/home_page.dart';
import 'package:the_movie_data_base/store/app_state.dart';

void main() => runApp(TheMovieApp());

class TheMovieApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    //
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: AppBarTheme(
            color: Colors.black,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
