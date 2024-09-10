import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/mode_cubit.dart';
import 'package:news_api/cubit/news_cubit.dart';
import 'package:news_api/cubit/news_state.dart';
import 'package:news_api/screens/business_screen.dart';
import 'package:news_api/screens/search_screen.dart';
import 'package:news_api/screens/since_screen.dart';
import 'package:news_api/screens/sports_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_api/cubit/news_cubit.dart';
// import 'package:news_api/model/news_model.dart';
// import 'package:news_api/repositery/my_repo.dart';
import 'package:news_api/web/web_service.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //NewsModel? newsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                  onPressed: () {
                    print(ModeCubit.get(context).isChangeMode);
                    ModeCubit.get(context).ChangeModeApp();
                  },
                  icon: Icon(Icons.brightness_3))
            ],
            title: Text('News App'),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              items: cubit.bttomItems),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
