import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class wepViewContainer extends StatefulWidget {
  wepViewContainer({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<wepViewContainer> createState() => _wepViewContainerState();
}

class _wepViewContainerState extends State<wepViewContainer> {
  var controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getWebView();
    isLoading = false;
  }

  Future<void> getWebView() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.category));
    return await controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
