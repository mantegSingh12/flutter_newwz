import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newwz/models/customAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({this.articleUrl});

  final articleUrl;

  @override
  _DetailPageState createState() => _DetailPageState(articleUrl);
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState(this.articleUrl);

  Completer<WebViewController> _completer = Completer<WebViewController>();
  final articleUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().customAppBar,
      body: Container(
        child: WebView(
          initialUrl: articleUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController wc) {
            _completer.complete(wc);
          },
        ),
      ),
    );
  }
}
