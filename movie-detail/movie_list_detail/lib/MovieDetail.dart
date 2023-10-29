import 'package:flutter/material.dart';
import 'package:movie_list_detail/Movie.dart';

class MovieDetail extends StatelessWidget {

  Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: [
          Image.network("https://image.tmdb.org/t/p/w500/" + movie.backdropPath),
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Original Name: " + movie.originalTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      Text(
                        "Release Date: " + movie.releaseDate,
                        style: TextStyle(
                          color: Colors.grey[500]
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.star, 
                  color: Colors.red
                ),
                Text('${movie.voteAverage}'),
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Text(
                movie.overview,
                softWrap: true,
              )
            ),
        ],
      ),
    );
  }
}