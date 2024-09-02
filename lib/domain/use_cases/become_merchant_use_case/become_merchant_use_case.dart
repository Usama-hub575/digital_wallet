import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class BecomeMerchantUseCase {
  BecomeMerchantUseCase({
    required this.becomeMerchantRepo,
  });

  final BecomeMerchantRepo becomeMerchantRepo;

  Future<Either<Success, Failure>> createAndGetMerchant({
    var payload,
    image,
  }) async {
    final response = await becomeMerchantRepo.createAndGetMerchant(
      image: image,
      payload: payload,
    );
    return response.fold(
      (success) {
        return Left(
          success,
        );
      },
      (r) {
        return Right(
          r,
        );
      },
    );
  }

  Future<Either<MerchantDashboardResponseModel, Failure>>
      getMerchantDashboardData() async {
    final response = await becomeMerchantRepo.getMerchantDashboardData();
    return response.fold(
      (success) {
        return Left(
          success,
        );
      },
      (r) {
        return Right(
          r,
        );
      },
    );
  }

  Future<Either<TransactionsResponseModel, Failure>> getTransactions({
    bool sent = false,
  }) async {
    final response = await becomeMerchantRepo.getTransactions(
      sent: sent,
    );
    return response.fold(
      (success) {
        return Left(
          success,
        );
      },
      (r) {
        return Right(
          r,
        );
      },
    );
  }
}
