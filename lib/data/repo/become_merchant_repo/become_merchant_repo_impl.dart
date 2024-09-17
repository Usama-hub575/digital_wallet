import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class BecomeMerchantRepoImpl implements BecomeMerchantRepo {
  BecomeMerchantRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  @override
  Future<Either<Success, Failure>> createAndGetMerchant({
    var payload,
    required XFile image,
  }) async {
    final response = await networkHelper.multipart(
      endPoints.getAndCreateMerchantEndPoint(),
      body: payload,
      files: {
        "cnic_photo": image,
      },
      headers: <String, String>{
        "Authorization":
            'Bearer ${storage.getString(key: StorageKeys.accessToken)}',
        "Content-Type": "application/json",
      },
    );
    return response.fold(
      (success) async {
        final getDetails = await networkHelper.get(
          endPoints.getAndCreateMerchantEndPoint(),
        );
        return getDetails.fold(
          (success) {
            return Left(
              Success(),
            );
          },
          (r) {
            return Right(
              Failure(
                status: r.status,
                message: r.message,
              ),
            );
          },
        );
      },
      (r) {
        return Right(
          Failure(
            status: r.status,
            message: r.message,
          ),
        );
      },
    );
  }

  @override
  Future<Either<MerchantDashboardResponseModel, Failure>>
      getMerchantDashboardData() async {
    final response = await networkHelper.get(
      endPoints.getMerchantDashboardDataEndPoint(),
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(
          success,
        );
        return Left(
          MerchantDashboardResponseModel.fromJson(
            decodedResponse,
          ),
        );
      },
      (r) {
        return Right(
          Failure(
            status: r.status,
            message: r.message,
          ),
        );
      },
    );
  }

  @override
  Future<Either<TransactionsResponseModel, Failure>> getTransactions({
    bool sent = false,
    String? url,
    int? page,
  }) async {
    final response = await networkHelper.get(
      sent
          ? page != null
              ? endPoints.getMerchantSentPaginatedTransactionEndPoint(
                  page: page.toString(),
                )
              : endPoints.getMerchantSentTransactionEndPoint()
          : page != null
              ? endPoints.getMerchantReceivedPaginatedTransactionEndPoint(
                  page: page.toString(),
                )
              : endPoints.getMerchantReceivedTransactionEndPoint(),
      headers: <String, String>{
        "Authorization":
            'Bearer ${storage.getString(key: StorageKeys.accessToken)}',
        "Content-Type": "application/json",
      },
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(
          success,
        );
        return Left(
          TransactionsResponseModel.fromJson(
            decodedResponse,
          ),
        );
      },
      (r) {
        return Right(
          Failure(
            status: r.status,
            message: r.message,
          ),
        );
      },
    );
  }
}
