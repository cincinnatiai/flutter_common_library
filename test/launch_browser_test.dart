import 'package:common/widget/launch_browser/launch_browser_contract.dart';
import 'package:flutter_test/flutter_test.dart';

class TestLaunchURLBrowser implements LaunchURLBrowserContract {
  final Future<bool> Function(Uri uri) launchUrlFunction;

  TestLaunchURLBrowser(this.launchUrlFunction);

  @override
  Future<void> openWebBrowserWithURL(String url) async {
    final Uri uri = Uri.parse(url.replaceAll('"', ''));

    if (!await launchUrlFunction(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}

void main() {
  group('LaunchURLBrowser tests', () {
    const mockUrl = 'https://example.com';
    test('openWebBrowserWithURL launches the browser successfully', () async {
      Future<bool> mockLaunchFunction(Uri uri) async {
        return true;
      }

      final browser = TestLaunchURLBrowser(mockLaunchFunction);

      await browser.openWebBrowserWithURL(mockUrl);
    });

    test('openWebBrowserWithURL throws an exception on launch failure',
        () async {
      Future<bool> mockLaunchFunction(Uri uri) async {
        return false;
      }

      final browser = TestLaunchURLBrowser(mockLaunchFunction);

      expect(
        () async => await browser.openWebBrowserWithURL(mockUrl),
        throwsException,
      );
    });
  });
}
