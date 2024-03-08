import 'package:common/enums/enums.dart';
import 'package:localization/localization.dart';

abstract class CommonFormatterContract {
  SearchByEnvironment getSearchByEnvironmentFromString(String environment);
}

class CommonFormatter extends CommonFormatterContract {
  Map<String, SearchByEnvironment> environmentMap = {
    "environment-gamma".i18n(): SearchByEnvironment.gamma,
    "environment-prod".i18n(): SearchByEnvironment.prod,
    "environment-dev".i18n(): SearchByEnvironment.dev,
  };

  @override
  SearchByEnvironment getSearchByEnvironmentFromString(String environment) {
    return environmentMap[environment] ?? SearchByEnvironment.prod;
  }
}
