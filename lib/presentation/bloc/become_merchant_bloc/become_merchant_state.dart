part of 'become_merchant_bloc.dart';

class BecomeMerchantState extends Equatable {
  BecomeMerchantStatus status;
  XFile? image;
  String errorMessage;
  MerchantDashboardResponseModel merchantDashboardResponseModel =
      MerchantDashboardResponseModel.empty();
  TransactionsResponseModel transactionsResponseModel =
      TransactionsResponseModel.empty();

  BecomeMerchantState({
    this.status = BecomeMerchantStatus.init,
    this.image,
    this.errorMessage = "",
    required this.merchantDashboardResponseModel,
    required this.transactionsResponseModel,
  });

  BecomeMerchantState copyWith({
    BecomeMerchantStatus? status,
    XFile? image,
    String? errorMessage,
    MerchantDashboardResponseModel? merchantDashboardResponseModel,
    TransactionsResponseModel? transactionsResponseModel,
  }) {
    return BecomeMerchantState(
      image: image ?? this.image,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      merchantDashboardResponseModel:
          merchantDashboardResponseModel ?? this.merchantDashboardResponseModel,
      transactionsResponseModel:
          transactionsResponseModel ?? this.transactionsResponseModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        image,
        merchantDashboardResponseModel,
        transactionsResponseModel,
        errorMessage,
      ];
}
