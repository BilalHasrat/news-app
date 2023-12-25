
class NewsArt{
  String imageUtl;
  String newsContent;
  String newsDes;
  String newsHead;
  String newUrl;
  NewsArt({
   required this.newUrl,
   required this.imageUtl,
   required this.newsContent,
   required this.newsDes,
   required this.newsHead
});

  static NewsArt fromJson(Map<String , dynamic> articles){
    return NewsArt(
        newUrl: articles['url']??'--',
        imageUtl: articles['urlToImage']??'--',
        newsContent: articles['content']??'--',
        newsDes: articles['description']??'--',
        newsHead: articles['title']??'--'
    );
  }
}