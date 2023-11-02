import 'package:movieapp/data/repos/movies_repo/data_sources/online_data_sources.dart';

import '../../model/popular_movies_responses.dart';

class MoviesRepo
{
  OnlineDataSources onlineDataSources;

  MoviesRepo(this.onlineDataSources);

  Future<PopularMoviesResponses?> getPopMovies() async
  {
    PopularMoviesResponses responses = await onlineDataSources.getPopularMovies();
    return responses;
  }
}
