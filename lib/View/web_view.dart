import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key,required this.controllerWeb});
  final WebViewController controllerWeb ;

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:WebViewWidget(controller: controllerWeb),
    );
  }
}
