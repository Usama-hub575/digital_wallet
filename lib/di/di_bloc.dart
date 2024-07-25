import 'package:digital_wallet/export.dart';

Future initializeBlocs() async {
    it.registerLazySingleton(
      () => AuthBloc(
        authUseCase: it<AuthUseCase>(),
      ),
    );
}
