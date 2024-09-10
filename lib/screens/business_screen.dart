import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/View/web_view.dart';
import 'package:news_api/cubit/news_cubit.dart';
import 'package:news_api/cubit/news_state.dart';
import 'package:news_api/widget/componants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        var controllerw = WebViewController();
        return ConditionalBuilder(
          condition: state is! NewsLoadingBusinessState,
          builder: (context) {
            if (list.isNotEmpty) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                            controllerWeb: controllerw
                              ..loadRequest(
                                Uri.parse(list[index]['url']),
                              ),
                          ),
                        ),
                      );
                    },
                    child: BuildArticalItem(artical: list[index]),
                    ),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(),
                ),
                itemCount: list.length,
              );
            } else {
              return const Center(
                child: Text(
                  'No articles available.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          ),
        );
      },
    );
  }
}
