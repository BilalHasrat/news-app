import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/controllor/fetch_data.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/veiw/Widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late NewsArt newsArt;
   bool loading = true;
  getNews()async{
     newsArt =  await FetchNews.fetchNews();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        controller: PageController(initialPage: 0),
        physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,

        onPageChanged: (value){
          setState(() {
            loading = true;
          });
          getNews();
        },

        itemBuilder: (context, index) {
          return loading ? Center(child: CircularProgressIndicator(),): NewsContainer(
            imgUrl: newsArt.imageUtl,
            newsDes: newsArt.newsDes,
          newsHead: newsArt.newsHead,
          newsUrl: newsArt.newUrl,
          newsCnt: newsArt.newsContent,);
      },
      ),
    );
  }
}
