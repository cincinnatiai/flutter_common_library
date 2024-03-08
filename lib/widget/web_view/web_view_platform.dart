import 'package:common/utils/platform_utils.dart';
import 'package:common/widget/web_view/details_web_view.dart';
import 'package:common/widget/web_view/details_web_view_mac.dart';
import 'package:flutter/material.dart';

Widget webViewFromPlatform(String htmlString) {
  if (isIOS || isAndroid) {
    return WebViewFromHtml(htmlString: htmlString);
  } else if (isMacOS) {
    return WebViewFromHtmlForMAC(htmlString: htmlString);
  } else {
    return const SizedBox();
  }
}
