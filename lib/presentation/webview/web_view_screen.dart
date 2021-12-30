import 'dart:async';
import 'dart:io';

import 'package:ccvc_mobile/data/exception/app_exception.dart';
import 'package:ccvc_mobile/domain/locals/logger.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/utils/app_bar.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:ccvc_mobile/utils/get_ext.dart';
import 'package:ccvc_mobile/widgets/views/state_layout.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({required this.url, required this.title, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewScreenState();
  }
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  StateLayout _stateLayout = StateLayout.showLoading;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNormal(
        title: widget.title,
        leading: ImageAssets.svgAssets(ImageAssets.icBack),
        context: context,
      ),
      body: StateFullLayout(
        stateLayout: _stateLayout,
        retry: () {
          reload();
        },
        error: AppException('', S.current.something_went_wrong),
        textEmpty: '',
        child: WillPopScope(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                logger.d('WebView is loading (progress : $progress%)');
              },
              javascriptChannels: const <JavascriptChannel>{},
              navigationDelegate: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                showLoading();
              },
              onPageFinished: (String url) {
                hideLoading();
              },
              onWebResourceError: (error) {
                showError();
              },
              gestureNavigationEnabled: true,
            ),
            onWillPop: () async {
              await backToPreScreen();
              return true;
            }),
      ),
    );
  }

  void showLoading() {
    if (_stateLayout != StateLayout.showLoading) {
      _stateLayout = StateLayout.showLoading;
    }
    setState(() {});
  }

  void hideLoading() {
    if (_stateLayout == StateLayout.showLoading) {
      _stateLayout = StateLayout.showContent;
    }
    setState(() {});
  }

  void showError() {
    _stateLayout = StateLayout.showError;
    setState(() {});
  }

  Future<void> reload() async {
    final WebViewController controller = await _controller.future;
    await controller.loadUrl(widget.url);
  }

  Future<void> backToPreScreen() async => finish();
}
