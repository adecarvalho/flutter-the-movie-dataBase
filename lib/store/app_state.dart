import 'package:flutter/material.dart';
import 'package:the_movie_data_base/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//
class AppState with ChangeNotifier {
  static const URL_FIND_MOVIES =
      "https://the-movie-database-server.decarvalho.now.sh/tmdb/api/v1/movies/";

  static const URL_GET_MOVIE =
      "https://the-movie-database-server.decarvalho.now.sh/tmdb/api/v1/movie/";

  static const FAKE_IMAGE =
      'https://fakeimg.pl/300x300/ccc/000/?text=No%20Image&font=lobster&font_size=40';
  //
  List<Movie> _movies = List<Movie>();
  Movie _theMovie = Movie();

  bool _isloading = false;
  String _errors = '';

//
  AppState() {
    //findMovieById('330298');
  }

//
  Future<void> _startLoading() async {
    _isloading = true;
    _errors = '';
    notifyListeners();
    //
    await Future.delayed(
      Duration(milliseconds: 100),
    );
    return null;
  }

//
  Future<void> findMovieById(String id) async {
    try {
      final String url = '$URL_GET_MOVIE $id';
      //
      await _startLoading();

      http.Response response = await http.get(url);
      Map datas = jsonDecode(response.body);

      //print(datas);

      if (datas.isNotEmpty) {
        //
        _theMovie = Movie(
          id: id,
          title: datas['title'],
          overview: datas['overview'],
          voteAverage: datas['vote_average'].toString() ?? '0',
          posterUrl: datas['poster_url'] ?? FAKE_IMAGE,
          backdropUrl: datas['backdrop_url'] ?? FAKE_IMAGE,
          releaseDate: datas['release_date'],
          runtime: datas['runtime'],
          //
          director: datas['director'],
          genres: datas['genres'],
          sound: datas['sound'],
          screenplay: datas['screenplay'],
          cast: datas['cast'],
          //
        );

        _isloading = false;
        _errors = '';
        notifyListeners();
      }

      //print(datas);
    } catch (e) {
      print(e);
      _isloading = false;
      _errors = e.toString();
      notifyListeners();
    }
    return null;
  }

//
  Future<void> findMovies(String name) async {
    try {
      final String url = '$URL_FIND_MOVIES $name';
      _movies = [];
      //
      await _startLoading();

      //
      http.Response response = await http.get(url);
      List datas = jsonDecode(response.body)['movies'];
      //
      for (var item in datas) {
        final Movie movie = Movie(
            id: item['id'].toString() ?? '0',
            title: item['title'],
            overview: item['overview'],
            posterUrl: item['poster_path'] ?? FAKE_IMAGE,
            releaseDate: item['release_date']);
        //
        //print(movie.toString());
        _movies.add(movie);
      }

      //
      //print(datas);
      _isloading = false;
      _errors = '';
      notifyListeners();

      return null;

      //
    } catch (e) {
      print(e);
      _isloading = false;
      _errors = e.toString();
      notifyListeners();
      return null;
    }
  }

//getter
  List<Movie> get movies => _movies;
  Movie get theMovie => _theMovie;
  bool get loading => _isloading;
  String get errors => _errors;
}
