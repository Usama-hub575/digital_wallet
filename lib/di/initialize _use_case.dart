import 'package:digital_wallet/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeAuthUseCase();
}

Future initializeAuthUseCase() async {
  it.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepo: it<AuthRepo>(),
    ),
  );

  it.registerLazySingleton<DashboardUseCase>(
        () => DashboardUseCase(
      dashboardRepo: it<DashboardRepo>(),
    ),
  );
}
