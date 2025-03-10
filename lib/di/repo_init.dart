import 'package:digital_wallet/export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  storage = StorageRepoImpl(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  it.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<DashboardRepo>(
    () => DashboardRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
  it.registerLazySingleton<BecomeMerchantRepo>(
    () => BecomeMerchantRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
}
