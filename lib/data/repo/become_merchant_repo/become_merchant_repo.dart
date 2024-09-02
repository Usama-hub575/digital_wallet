import 'package:dartz/dartz.dart';
import 'package:digital_wallet/data/models/merchant_dashboard_response_model.dart';
import 'package:digital_wallet/export.dart';

mixin BecomeMerchantRepo {
  Future<Either<Success, Failure>> createAndGetMerchant({
    var payload,
    required XFile image,
  });

  Future<Either<MerchantDashboardResponseModel, Failure>>
      getMerchantDashboardData();

  Future<Either<TransactionsResponseModel, Failure>> getTransactions({
    bool sent = false,
  });
}
