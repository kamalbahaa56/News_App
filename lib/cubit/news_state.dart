// part of 'news_cubit.dart';

// @immutable
// sealed class NewsState {}

// final class NewsInitial extends NewsState {}

// class LoadingNewsState extends NewsState {}

// class GetLoadedNewsState extends NewsState {
//   final NewsModel ?newsModel;
//   GetLoadedNewsState({required this.newsModel});
// }

// class ErrorNewsState extends NewsState {
//   final String error;
//   ErrorNewsState({required this.error});
// }
abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsLoadingBusinessState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetErrorBusinessState extends NewsStates {
  final String error;
  NewsGetErrorBusinessState(this.error);
}

class NewsLoadingSportsState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetErrorSportsState extends NewsStates {
  final String error;
  NewsGetErrorSportsState(this.error);
}

class NewsLoadingScienceState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetErrorScienceState extends NewsStates {
  final String error;
  NewsGetErrorScienceState(this.error);
}


class NewsLoadingSearchState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetErrorSearchState extends NewsStates {
  final String error;
  NewsGetErrorSearchState(this.error);
}


