import 'package:bloc/bloc.dart';
import 'package:flutter_app_bloc/api/movieservices.dart';
import 'event.dart';
import 'state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  MoviesBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MoviesEvent event) async* {
    if (event is LoadMovies) {
      yield MovieLoading();
      Services service = new Services();
      final movies = await service.getMovies();
      yield MovieLoaded(movies);
    }
    if(event is DeleteMovies) {
      yield MovieLoading();
      Services service = new Services();
      service.deleteEmployee(event.id);
      final movies = await service.getMovies();
      yield MovieLoaded(movies);
    }
  }


}
