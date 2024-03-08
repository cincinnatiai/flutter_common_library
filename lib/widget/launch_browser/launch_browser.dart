import 'package:common/widget/launch_browser/launch_browser_contract.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchURLBrowser implements LaunchURLBrowserContract {
  @override
  Future<void> openWebBrowserWithURL(String url) async {
    final Uri uri = Uri.parse(url.replaceAll('"', ''));

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $uri');
    }
  }
}
