import 'package:flutter/material.dart';
import 'package:news_app/controllor/fetch_data.dart';
import 'package:news_app/veiw/detail_view_screen.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer({Key? key,
     required this.imgUrl,
     required this.newsDes ,
     required this.newsHead,
     required this.newsUrl,
    required this.newsCnt,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: 'images/loading.png',
                image: imgUrl,)
            ),


            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsHead.length > 90 ? "${newsHead.substring(0,90)}..":newsHead,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    SizedBox(height: 20,),
                    Text(newsDes,style: TextStyle(fontSize: 12,color: Colors.black38)),
                    SizedBox(height: 20,),

                    Text(newsCnt != '--'?
                        newsCnt.length> 250? newsCnt.substring(0,250): "${newsCnt.substring(0,newsCnt.length - 15)}..." : newsCnt,
                        style: TextStyle(fontSize: 15,)),

                  ],
                ),
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl)));
                  }, child: Text('Read More')),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
