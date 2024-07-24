import 'package:digital_wallet/export.dart';

Future initializeNetworkDependencies() async {
  it.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(),
  );
}
