import 'package:realm/realm.dart';

import 'models/configuration_model.dart';

final config = Configuration.local(
  [
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  //path: '.realm/realm.db',
);