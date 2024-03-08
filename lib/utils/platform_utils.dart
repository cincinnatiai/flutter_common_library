import 'package:flutter/foundation.dart' as foundation;

bool get isIOS =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

bool get isMacOS =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.macOS;

bool get isAndroid =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.android;