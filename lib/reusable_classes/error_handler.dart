import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

enum AppError {
  timeout,
  format,
  http,
  unexpected,
}

class ErrorHandler {
  static String refactorError(dynamic error) {
    debugPrint("Type of error ----> ${error.runtimeType}");
    AppError errorType = _getErrorType(error);
    return _getErrorMessage(errorType);
  }

  static AppError _getErrorType(dynamic error) {
    if (error is TimeoutException ||
        error.toString().contains("timeout") ||
        error.toString().contains("timed out")) {
      return AppError.timeout;
    } else if (error is FormatException) {
      return AppError.format;
    } else if (error is HttpException) {
      return AppError.http;
    } else {
      return AppError.unexpected;
    }
  }

  static String _getDefaultErrorMessage() {
    return 'default-error'.i18n();
  }

  static String _getErrorMessage(AppError errorType) {
    switch (errorType) {
      case AppError.timeout:
        return 'internet-error'.i18n();
      case AppError.format:
        return 'format-error'.i18n();
      case AppError.http:
        return 'http-error'.i18n();
      case AppError.unexpected:
      default:
        return _getDefaultErrorMessage();
    }
  }
}
