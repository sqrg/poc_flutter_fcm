import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
void configureLocator() {
  locator.registerLazySingleton(() => FlutterSecureStorage());

  $initGetIt(locator);
}
