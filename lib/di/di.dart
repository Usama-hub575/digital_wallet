import 'package:digital_wallet/export.dart';

GetIt it = GetIt.instance;

Future<void> initializeDependencies() async {
  await Future.wait(
    [
      initializeNetworkDependencies(),
      initializeRepoDependencies(),
      initializeUseCaseDependencies(),
      initializeBlocs(),
    ],
  );
}
