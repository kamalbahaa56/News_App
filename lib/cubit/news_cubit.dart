// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:news_api/model/news_model.dart';
// import 'package:news_api/repositery/my_repo.dart';

// part 'news_state.dart';

// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit(this.myRepo) : super(NewsInitial());
//   final MyRepo myRepo;
//   getAllCharaters() {
//     emit(LoadingNewsState());
//     myRepo.getCharacters().then((newsmodel) {
//       print(newsmodel!.articles.toString());
//       return emit(GetLoadedNewsState(newsModel: newsmodel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(ErrorNewsState(error: error.toString()));
//     });
//   }
// }
// // emit(GetLoadedNewsState(newsModel:  newsmodel))

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/news_state.dart';
import 'package:news_api/screens/business_screen.dart';
import 'package:news_api/screens/settings_screen.dart';
import 'package:news_api/screens/since_screen.dart';
import 'package:news_api/screens/sports_screen.dart';
import 'package:news_api/web/web_service.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bttomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Scinece'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SinceScreen(),
    SettingsScreen()
  ];
  void changeNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List business = [];
  void getBusiness() {
    emit(NewsLoadingBusinessState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetErrorBusinessState(error.toString()));
    });
  }

  List sports = [];
  void getSports() {
    emit(NewsLoadingSportsState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetErrorSportsState(error.toString()));
    });

    List business = [];
    void getBusiness() {
      emit(NewsLoadingBusinessState());
      DioHelper.getData('v2/top-headlines', {
        'country': 'us',
        'category': 'business',
        'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetErrorBusinessState(error.toString()));
      });
    }
  }

  List science = [];
  void getScience() {
    emit(NewsLoadingScienceState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'science',
      'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetErrorScienceState(error.toString()));
    });
  }

// List search = [];
//   void getSearch(String value) {
//     emit(NewsLoadingSearchState());
//     search = [];
//     DioHelper.getData('v2/everything', {
//       'q': '$value',
//       'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
//     }).then((value) {
//       search = value.data['articles'];
//       print(business[0]['title']);
//       emit(NewsGetSearchSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(NewsGetErrorSearchState(error.toString()));
//     });
//   }


List search = [];
void getSearch(String value) async {
  emit(NewsLoadingSearchState());
  search = [];
  
  try {
    // Log the request details
    print('Searching for: $value');
    
    // Make the API request
    Response response = await DioHelper.getData('v2/everything', {
      'q': value,
      'apiKey': 'a8df51d60e2a4138ba773aa47a06acb4'
    });
    
    // Process the response data
    search = response.data['articles'];
    
    // Check if the search returned results
    if (search.isEmpty) {
      print('No results found for: $value');
    } else {
      print('Found ${search.length} results for: $value');
    }
    
    emit(NewsGetSearchSuccessState());
  } on DioException catch (e) {
    // Handle Dio-specific errors
    if (e.response != null) {
      print('Dio error! Status code: ${e.response!.statusCode}');
      print('Response data: ${e.response!.data}');
      print('Request was: ${e.requestOptions.uri}');
      
      // Handle specific status codes, e.g., 400
      if (e.response!.statusCode == 400) {
        print('Bad request: ${e.response!.data['message']}');
      }
    } else {
      print('Error sending request: ${e.message}');
    }
    
    emit(NewsGetErrorSearchState(e.toString()));
  } catch (e) {
    // Handle any other exceptions
    print('Unexpected error: $e');
    emit(NewsGetErrorSearchState(e.toString()));
  }
}


// https://newsapi.org/v2/everything?q=us&apiKey=a8df51d60e2a4138ba773aa47a0
}
