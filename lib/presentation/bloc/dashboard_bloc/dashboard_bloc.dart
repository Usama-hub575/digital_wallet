import 'package:digital_wallet/export.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.dashboardUseCase,
  }) : super(
          DashboardState(
            findUserResponseModel: FindUserResponseModel.empty(),
          ),
        ) {
    on<SetSecretKey>(_setSecretKey);
    on<SendMoney>(_sendMoney);
    on<FindUser>(_findUser);
    on<ProceedButtonLoading>(_loading);
    on<ProceedButtonLoading>(_loading);
  }

  final DashboardUseCase dashboardUseCase;

  _loading(ProceedButtonLoading event, emit) {
    emit(
      state.copyWith(
        status: DashboardStatus.loading,
      ),
    );
  }

  _setSecretKey(SetSecretKey event, emit) async {
    final response = await dashboardUseCase.setSecretKey(
      secretKey: event.secretKey,
    );
    return response.fold(
      (success) {},
      (r) {},
    );
  }

  _findUser(FindUser event, emit) async {
    final response = await dashboardUseCase.findUser(
      email: event.email,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            findUserResponseModel: FindUserResponseModel.fromJson(success),
            status: DashboardStatus.success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
          ),
        );
      },
    );
  }

  _sendMoney(SendMoney event, emit) async {
    final response = await dashboardUseCase.sendMoney(
      secretKey: event.secretKey,
      amount: event.amount,
      email: event.email,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: DashboardStatus.success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }
}
