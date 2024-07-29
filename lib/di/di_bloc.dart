import 'package:digital_wallet/export.dart';
import 'package:digital_wallet/presentation/bloc/host_bloc/export.dart';

Future initializeBlocs() async {
    it.registerLazySingleton(
      () => AuthBloc(
        authUseCase: it<AuthUseCase>(),
      ),
    );
    it.registerLazySingleton(
          () => HostBloc(
      ),
    );
}
