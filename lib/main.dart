import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/mode_cubit.dart';
import 'package:news_api/cubit/news_cubit.dart';
import 'package:news_api/get_it.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/screens/home_screen.dart';
import 'package:news_api/shared/cash_helper.dart';
import 'package:news_api/web/web_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool isDark = CashHelper.getData('isDark')??false;
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.isDark});
  final bool isDark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider<ModeCubit>(create: (context) => ModeCubit()..ChangeModeApp(fromShared: isDark)),
      ],
      child: BlocBuilder<ModeCubit, ModeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.red,
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            //---------------------- DARK tHEM ----------------------------------------------------
            darkTheme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0,
                    unselectedItemColor: Colors.grey),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.grey,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.grey,
                  elevation: 0,
                ),
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
                //brightness: Brightness.dark

                ),
            // ------------------- Theme Mode-----------------------------
            themeMode: ModeCubit.get(context).isChangeMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
