import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WebViewFromHtmlForMAC extends StatefulWidget {
  final String htmlString;

  const WebViewFromHtmlForMAC({super.key, required this.htmlString});

  @override
  State<WebViewFromHtmlForMAC> createState() => _WebViewFromHtmlForMAC();
}

class _WebViewFromHtmlForMAC extends State<WebViewFromHtmlForMAC> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: widget.htmlString,
      ),
    );
  }
}
