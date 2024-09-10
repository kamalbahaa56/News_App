// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
    final String? status;
    final int? totalResults;
    final List? articles;

    NewsModel({
        this.status,
        this.totalResults,
        this.articles,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((x) => x?.toMap()).toList(),
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      status: map['status'] != null ? map['status'] as String : null,
      totalResults: map['totalResults'] != null ? map['totalResults'] as int : null,
      articles: map['articles'] != null ? List.from((map['articles'] as List).map<Article?>((x) => Article.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) => NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Article {
    final Source? source;
    final String? author;
    final String? title;
    final dynamic description;
    final String? url;
    final dynamic urlToImage;
    final dynamic publishedAt;
    final dynamic content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.millisecondsSinceEpoch,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source'] as Map<String,dynamic>) : null,
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] as dynamic,
      url: map['url'] != null ? map['url'] as String : null,
      urlToImage: map['urlToImage'] as dynamic,
      publishedAt: map['publishedAt'] != null ? map['publishedAt'] as String : null,
      content: map['content'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Source {
    final String? id;
    final String? name;

    Source({
        this.id,
        this.name,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] != null ? map['id']: null,
      name: map['name'] != null ?map['name'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source) as Map<String, dynamic>);
}


