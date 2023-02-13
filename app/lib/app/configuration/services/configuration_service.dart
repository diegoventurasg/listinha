import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../../shared/services/realm/models/configuration_model.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeModeName, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    final result = realm.all<ConfigurationModel>();
    if (result.isEmpty) {
      return ConfigurationModel(ThemeMode.system.name);
    }

    return result.first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    realm.write(() {
      realm.deleteAll<ConfigurationModel>();
    });
  }
}
