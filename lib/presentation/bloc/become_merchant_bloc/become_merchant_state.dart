part of 'become_merchant_bloc.dart';

class BecomeMerchantState extends Equatable {
  BecomeMerchantStatus status;
  XFile? image;
  String errorMessage;
  List<Results>? results;
  bool isLoading;
  MerchantDashboardResponseModel merchantDashboardResponseModel =
      MerchantDashboardResponseModel.empty();
  TransactionsResponseModel transactionsResponseModel =
      TransactionsResponseModel.empty();

  BecomeMerchantState({
    this.status = BecomeMerchantStatus.init,
    this.image,
    this.errorMessage = "",
    this.isLoading = false,
    required this.merchantDashboardResponseModel,
    required this.transactionsResponseModel,
    this.results,
  });

  BecomeMerchantState copyWith({
    BecomeMerchantStatus? status,
    XFile? image,
    String? errorMessage,
    bool? isLoading,
    MerchantDashboardResponseModel? merchantDashboardResponseModel,
    TransactionsResponseModel? transactionsResponseModel,
    List<Results>? results,
  }) {
    return BecomeMerchantState(
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      results: results ?? this.results,
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
        isLoading,
        results,
      ];
}
