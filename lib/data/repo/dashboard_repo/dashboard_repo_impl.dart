import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class DashboardRepoImpl implements DashboardRepo {
  DashboardRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  @override
  Future<Either<dynamic, Failure>> setSecretKey({
    required String secretKey,
  }) async {
    final response = await networkHelper.post(
      endPoints.getSecretKeyEndPoint(),
      body: {
        "secret_key": secretKey,
      },
    );
    return response.fold(
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
  }

  @override
  Future<Either<dynamic, Failure>> sendMoney({
    required String email,
    required String amount,
    required String secretKey,
  }) async {
    final response = await networkHelper.post(
      endPoints.getSendMoneyEndPoint(),
      body: {"email": email, "amount": amount, "secret_key": secretKey},
    );
    return response.fold(
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
  }

  @override
  Future<Either<dynamic, Failure>> requestMoney({
    required String email,
    required String amount,
    required String secretKey,
  }) async {
    final response = await networkHelper.post(
      endPoints.getRequestMoneyEndPoint(),
      body: {
        "receiver_email": email,
        "amount": amount,
        "secret_key": secretKey
      },
    );
    return response.fold(
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
  }

  @override
  Future<Either<dynamic, Failure>> findUser({
    required String email,
  }) async {
    final response = await networkHelper.post(
      endPoints.getFindUserEndPoint(),
      body: {
        "email": email,
      },
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(success);
        return Left(
          decodedResponse,
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
  Future<Either<dynamic, Failure>> acceptMoney({
    required String requestID,
  }) async {
    final response = await networkHelper.post(
      endPoints.getAcceptMoneyEndPoint(),
      body: {
        "request_id": requestID,
      },
    );

    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(success);
        return Left(
          decodedResponse,
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
  Future<Either<dynamic, Failure>> getRequests() async {
    final response = await networkHelper.get(
      endPoints.getRequestMoneyEndPoint(),
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(success);
        return Left(
          decodedResponse,
        );
      },
      (r) {
        return Right(r);
      },
    );
  }
}
