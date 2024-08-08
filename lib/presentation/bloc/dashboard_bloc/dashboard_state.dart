part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  DashboardStatus status;
  String errorMessage;
  FindUserResponseModel findUserResponseModel = FindUserResponseModel.empty();
  RequestsResponseModel requestsResponseModel = RequestsResponseModel.empty();
  GetProfileResponseModel getProfileResponseModel =
  GetProfileResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    this.errorMessage = '',
    required this.findUserResponseModel,
    required this.requestsResponseModel,
    required this.getProfileResponseModel,
  });

  DashboardState copyWith({
    DashboardStatus? status,
    String? errorMessage,
    FindUserResponseModel? findUserResponseModel,
    RequestsResponseModel? requestsResponseModel,
    GetProfileResponseModel? getProfileResponseModel,
  }) {
    return DashboardState(
      getProfileResponseModel:
      getProfileResponseModel ?? this.getProfileResponseModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      findUserResponseModel:
          findUserResponseModel ?? this.findUserResponseModel,
      requestsResponseModel:
          requestsResponseModel ?? this.requestsResponseModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        findUserResponseModel,
    getProfileResponseModel,
        requestsResponseModel,
      ];
}
