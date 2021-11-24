import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movies/bloc.dart';
import 'movies/event.dart';
import 'movies/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: BlocProvider(
        create: (BuildContext context) => MoviesBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var bloc;


@override
  void initState() {
    bloc = BlocProvider.of<MoviesBloc>(context);
    bloc.add(LoadMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 500,
          child: BlocBuilder<MoviesBloc, MovieState>(
              builder: (context, state) {
                if(state is MovieLoaded)
                {
                  var movies = state.movies;
                  return movieList(movies);
                }
                if(state is MovieLoading)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }// return widget here based on BlocA's state
              }
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  movieList(movies) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
              //leading: Icon(Icons.list),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  bloc.add(DeleteMovies(movies[index].id));
                },
              ),
              title:Text(movies[index].name),
          );
        }
    );
 }

}
