// import 'package:news_api/model/news_model.dart';
// import 'package:news_api/web/web_service.dart';

// class MyRepo {
//   final DioHelper dioHelper;
//   MyRepo(this.dioHelper);
//    Future<NewsModel?> getCharacters() async {
//     final response = await dioHelper
//         .getMethod('v2/top-headlines', {
//           'country':'eg',
//           'category':'business',
//           'apiKey':'a8df51d60e2a4138ba773aa47a06acb4'
//         });
//     if (response != null) {
//       if (response.statusCode == 200) {
//         final NewsModel newsModel =
//             NewsModel.fromMap(response.data);

//         return newsModel;
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }
// }
