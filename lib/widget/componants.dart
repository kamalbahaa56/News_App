import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

class BuildArticalItem extends StatelessWidget {
  BuildArticalItem({super.key, required this.artical});
  var artical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: artical['urlToImage'] == null
                  ? DecorationImage(
                      image: AssetImage('assets/images/animation.gif'),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: NetworkImage('${artical['urlToImage']}'),
                      fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    '${artical['publishedAt']}',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
