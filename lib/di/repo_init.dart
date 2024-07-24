import 'package:digital_wallet/export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  storage = StorageRepoImpl(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

}
