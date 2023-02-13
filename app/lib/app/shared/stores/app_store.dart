// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  void init() {
    final model = _configurationService.getConfiguration();
    themeMode.value = _getThemeModeByBame(model.themeModeName);
    syncDate.value = model.syncDate;
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteApp() {
    _configurationService.deleteAll();
  }

  ThemeMode _getThemeModeByBame(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
