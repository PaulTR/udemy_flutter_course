import 'dart:io';
import 'dart:convert';

import 'package:movie_list_detail/Movie.dart';

import 'package:flutter/material.dart';
import 'package:movie_list_detail/MovieDetail.dart';

class MovieList extends StatelessWidget {

// API key: d50a0cce0ce03732968fe50a7ae41c05

  Future<List<Movie>> getMovies() async {
    const String url = 'http://api.themoviedb.org/3/movie/top_rated?api_key=d50a0cce0ce03732968fe50a7ae41c05';
    var httpClient = HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      
      if( response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        return createMovieList(json);
      } else {
        print("Failed to properly retrieve movies");
      }

    } catch (exception) {
      print(exception.toString());
    }

    return List.empty();
  }

  List<Movie> createMovieList(String resultString) {
    List results = getResultsList(resultString);

    List<Movie> list = <Movie>[];

    for(int i = 0; i < results.length; i++) {
      list.add(createMovieObject(results[i]));
    }

    return list;
  }

  List getResultsList(String jsonString) {
    var data = json.decode(jsonString);

    return data["results"];
  }

  Movie createMovieObject(objectItem) {
    return Movie(
      objectItem["title"],
      objectItem["poster_path"],
      objectItem["backdrop_path"],
      objectItem["original_title"],
      objectItem["vote_average"],
      objectItem["overview"],
      objectItem["release_date"]
    );
  }

  List<Widget> createMovieCardItem(List<Movie> movies, BuildContext context) {
    List<Widget> listElementWidgetList = <Widget>[];

    if( movies != null ) {
      var lengthOfList = movies.length;
      for(int i = 0; i < lengthOfList; i++) {
        Movie movie = movies[i];

        var imageUrl = "https://image.tmdb.org/t/p/w500/" + movie.posterPath;

        var listItem = GridTile(
          footer: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MovieDetail(movie)
                )
              );
            },
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(movie.title)
            ),
          ), child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MovieDetail(movie)
                )
              );
            },
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
        listElementWidgetList.add(listItem);
      }
    }

    return listElementWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovies(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if( !snapshot.hasData ) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator()))
          );
        }
        List<Movie> movies = snapshot.data as List<Movie>;

        return CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  children: createMovieCardItem(movies, context),
                )
              )
          ]
        );
      }
    );
  }

}