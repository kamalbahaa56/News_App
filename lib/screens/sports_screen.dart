import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/View/web_view.dart';
import 'package:news_api/cubit/news_cubit.dart';
import 'package:news_api/cubit/news_state.dart';
import 'package:news_api/widget/componants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        var controllerw = WebViewController();
        return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                            controllerWeb: controllerw
                              ..loadRequest(
                                Uri.parse(list[index]['url']),
                              )..setJavaScriptMode(JavaScriptMode.unrestricted),
                               
                          ),
                        ),
                      );
                    },
                    child: BuildArticalItem(
                      artical: list[index],
                    )),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Divider(),
                    ),
                itemCount: list.length),
            fallback: (context) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                )));
      },
    );
  }
}
