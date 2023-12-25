import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailViewScreen extends StatefulWidget {

   String newsUrl;
   DetailViewScreen({Key? key,required this.newsUrl}) : super(key: key);

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http") ?
      widget.newsUrl.replaceAll('http:', 'https:') : widget.newsUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(widget.newsUrl)),
      )
    );
  }
}
