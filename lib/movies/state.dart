abstract class MovieState {}

class MovieLoaded extends MovieState {
  var movies;
  MovieLoaded(this.movies);
}
class MovieLoading extends MovieState {}

