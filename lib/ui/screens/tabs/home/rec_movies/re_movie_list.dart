import 'package:flutter/material.dart';
import 'package:movieapp/data/model/recommended_movies_responses.dart';
import 'package:movieapp/data/repos/movies_repo/data_sources/online_data_sources.dart';
import 'package:movieapp/ui/widgets/error_widget.dart';
import 'package:movieapp/ui/widgets/loadeing_widget.dart';

import 'build_re_movie.dart';

class ReMovieList extends StatelessWidget {
  ReMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OnlineDataSources.getRecommendedMovies(),
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
          return buildMoviesList(snapshot.data!);
        }
        else if(snapshot.hasError)
        {
          return ErrorView(message: snapshot.error.toString());
        }
        else
        {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget buildMoviesList(List<ResultsRec> reMovie) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: reMovie.length,
      itemBuilder: (context, index) {
        return BuildReMovie(resultsRe: reMovie[index]);
      },
    );
  }
}