import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFromHtml extends StatefulWidget {
  final String htmlString;

  const WebViewFromHtml({super.key, required this.htmlString});

  @override
  State<WebViewFromHtml> createState() => _WebViewFromHtmlState();
}

class _WebViewFromHtmlState extends State<WebViewFromHtml> {
  late final WebViewController _controller;
  static const String defaultErrorHtml =
      '<!DOCTYPE html><html><head><!-- HTML Codes by Quackit.com --><title></title><meta name="viewport",content="width=device-width, initial-scale=1"><style>body {background-color:#ffffff;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;}h1{font-family:Arial, sans-serif;color:#000000;background-color:#ffffff;}p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#ffffff;}</style></head><body><h1>Sorry</h1><p>The content is not available, please retry.</p></body></html>';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.loadHtmlString(defaultErrorHtml);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.htmlString.isNotEmpty) {
      _controller.loadHtmlString(widget.htmlString);
    }
    return Center(
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
