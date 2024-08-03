part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetSecretKey extends DashboardEvent {
  final String secretKey;

  SetSecretKey({
    required this.secretKey,
  });
}

class FindUser extends DashboardEvent {
  final String email;

  FindUser({
    required this.email,
  });
}

class FullScreenLoading extends DashboardEvent {}

class AcceptMoney extends DashboardEvent {
  final String requestID;

  AcceptMoney({
    required this.requestID,
  });
}

class GetRequests extends DashboardEvent {}

class ProceedButtonLoading extends DashboardEvent {}

class SendMoney extends DashboardEvent {
  final String email;
  final String amount;
  final String secretKey;

  SendMoney({
    required this.email,
    required this.amount,
    required this.secretKey,
  });
}

class RequestMoney extends DashboardEvent {
  final String email;
  final String amount;
  final String secretKey;

  RequestMoney({
    required this.email,
    required this.amount,
    required this.secretKey,
  });
}

class GetProfileFromSendMoney extends DashboardEvent {}
