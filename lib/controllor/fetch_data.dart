import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class FetchNews {

  static List sourcesId = [
    "al-jazeera-english",
    "bbc-news",
    "bbc-sport",
    "entertainment-weekly",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "the-hindu",
    "the-washington-times",
    "usa-today",
  ];
  static Future<NewsArt> fetchNews() async {
    
    final _random = Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);

    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=af4a261374f24d82b7e695ff5c8fda8e'));
    Map data = jsonDecode(response.body);
    List articles = data['articles'];
    print(data);

    final _Newrandom = Random();
    var myArticles = articles[_Newrandom.nextInt(articles.length)];
    return NewsArt.fromJson(myArticles);
  }
}
