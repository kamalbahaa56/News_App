import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/news_cubit.dart';
import 'package:news_api/cubit/news_state.dart';
import 'package:news_api/widget/componants.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  20,
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Search'),
                    prefix: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              // issue is her need listviwe.builder need index ;
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return BuildArticalItem(
                      artical: list[index],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
