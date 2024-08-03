import 'package:digital_wallet/export.dart';

Future initializeBlocs() async {
  it.registerLazySingleton(
    () => AuthBloc(
      authUseCase: it<AuthUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => HostBloc(),
  );
  it.registerLazySingleton(
    () => DashboardBloc(
      dashboardUseCase: it<DashboardUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => QRBloc(),
  );
}
