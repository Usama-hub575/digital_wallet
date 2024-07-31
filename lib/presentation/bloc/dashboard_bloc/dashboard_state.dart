part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  DashboardStatus status;
  String errorMessage;
  FindUserResponseModel findUserResponseModel = FindUserResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    this.errorMessage = '',
    required this.findUserResponseModel,
  });

  DashboardState copyWith({
    DashboardStatus? status,
    String? errorMessage,
    FindUserResponseModel? findUserResponseModel,
  }) {
    return DashboardState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      findUserResponseModel:
          findUserResponseModel ?? this.findUserResponseModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        findUserResponseModel,
      ];
}
