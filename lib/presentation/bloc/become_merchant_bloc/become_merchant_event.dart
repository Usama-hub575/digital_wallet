part of 'become_merchant_bloc.dart';

class BecomeMerchantEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaptureImage extends BecomeMerchantEvent {}

class MerchantLoading extends BecomeMerchantEvent {}

class GetMerchantDashboardData extends BecomeMerchantEvent {}

class GetTransactions extends BecomeMerchantEvent {
  GetTransactions({
    this.sent = false,
    this.url,
    this.page,
  });

  final bool sent;
  final String? url;
  final int? page;
}

class CreateAndGetMerchant extends BecomeMerchantEvent {
  CreateAndGetMerchant({
    required this.payload,
  });

  final dynamic payload;
}
