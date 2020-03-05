class Movie {
  String id;
  String title;
  String voteAverage;
  String overview;
  String releaseDate;
  String posterUrl;
  String backdropUrl;
  int runtime;
  List genres = [];
  List director = [];
  List screenplay = [];
  List sound = [];
  List cast = [];

//
  Movie({
    this.id = '0',
    this.title = '',
    this.voteAverage = '0',
    this.overview = '',
    this.releaseDate = '',
    this.posterUrl = '',
    this.backdropUrl = '',
    this.runtime = 0,
    this.genres,
    this.director,
    this.screenplay,
    this.sound,
    this.cast,
  });

  //
  String toString() {
    return 'Titre:$title Resume:$overview';
  }
}
