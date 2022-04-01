import 'dart:io';

import 'package:ccvc_mobile/widgets/appbar/app_bar_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamProcessScreen extends StatefulWidget {
  // final String id;
  // final String token;
  // final StateDocument state;
  // const StreamProcessScreen(
  //     {required this.id,
  //       this.state = StateDocument.vanbanden,
  //       required this.token});
  @override
  StreamProcessScreenState createState() => StreamProcessScreenState();
}

class StreamProcessScreenState extends State<StreamProcessScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    const String url = 'https://ccvc-uat.chinhquyendientu.vn/dashboard';
    // switch (widget.state) {
    // }
    return Scaffold(
      appBar: AppBarDefaultClose('Luồng xử lý', Colors.black),
      body: const SafeArea(
        child: WebView(
          allowsInlineMediaPlayback: true,
          gestureNavigationEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
