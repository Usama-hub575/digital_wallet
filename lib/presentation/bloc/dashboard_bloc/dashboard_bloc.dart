import 'package:digital_wallet/export.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.dashboardUseCase,
  }) : super(
          DashboardState(
            findUserResponseModel: FindUserResponseModel.empty(),
            requestsResponseModel: RequestsResponseModel.empty(),
          ),
        ) {
    on<SetSecretKey>(_setSecretKey);
    on<SendMoney>(_sendMoney);
    on<RequestMoney>(_requestMoney);
    on<FindUser>(_findUser);
    on<ProceedButtonLoading>(_proceedButtonLoading);
    on<AcceptMoney>(_acceptMoney);
    on<GetRequests>(_getRequests);
    on<FullScreenLoading>(_loading);
  }

  final DashboardUseCase dashboardUseCase;

  _loading(FullScreenLoading event, emit) {
    emit(
      state.copyWith(
        status: DashboardStatus.loading,
      ),
    );
  }

  _proceedButtonLoading(ProceedButtonLoading event, emit) {
    emit(
      state.copyWith(
        status: DashboardStatus.buttonLoading,
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

  _getRequests(GetRequests event, emit) async {
    final response = await dashboardUseCase.getRequests();
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            requestsResponseModel: RequestsResponseModel.fromJson(success),
            status: DashboardStatus.pendingRequestsSuccess,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            errorMessage: r.message,
            status: DashboardStatus.error,
          ),
        );
      },
    );
  }

  _acceptMoney(AcceptMoney event, emit) async {
    final response = await dashboardUseCase.acceptMoney(
      requestID: event.requestID,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: DashboardStatus.acceptMoneySuccess,
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
            status: DashboardStatus.sendMoneySuccess,
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

  _requestMoney(RequestMoney event, emit) async {
    final response = await dashboardUseCase.requestMoney(
      secretKey: event.secretKey,
      amount: event.amount,
      email: event.email,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: DashboardStatus.requestMoneySuccess,
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
