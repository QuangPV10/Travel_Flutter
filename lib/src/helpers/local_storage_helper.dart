import 'package:hive_flutter/hive_flutter.dart';

class LocalStoragehelper {
  LocalStoragehelper._internal();

  static final LocalStoragehelper _shared = LocalStoragehelper._internal();

  factory LocalStoragehelper() {
    return _shared;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorageHelper() async {
    _shared.hiveBox = await Hive.openBox('TravoApp');
  }

  static dynamic getVaue(String key) {
    return _shared.hiveBox?.get(key);
  }

  static dynamic setValue(String key, dynamic value) {
    return _shared.hiveBox?.put(key, value);
  }
}
