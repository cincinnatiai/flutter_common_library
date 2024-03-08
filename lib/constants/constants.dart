import 'package:localization/localization.dart';

const String fetchAllAction = "fetchAll";
const String findMeAction = "findMe";
const String createAction = "create";
const String updateAction = "update";
const String deleteAction = "delete";
const String fetchByUserAction = "fetchByUser";
const String clientType = "consumer";
const String fetch = "fetch";
final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp numberRegExp = RegExp(r'[0-9.]');

final List<String> optionsEnvironment = [
  "environment-gamma".i18n(),
  "environment-prod".i18n(),
  "environment-dev".i18n(),
];

final List<String> optionsCategory = [
  "category-android".i18n(),
  "category-test".i18n(),
  "androidquiz".i18n(),
  "category-engineering".i18n(),
];
