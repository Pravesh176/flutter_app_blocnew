abstract class MoviesEvent {}

class InitEvent extends MoviesEvent {}

class LoadMovies extends MoviesEvent {}

class DeleteMovies extends MoviesEvent {
  var id;
  DeleteMovies(this.id);
}