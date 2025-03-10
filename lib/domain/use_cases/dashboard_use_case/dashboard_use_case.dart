import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class DashboardUseCase {
  DashboardUseCase({
    required this.dashboardRepo,
  });

  final DashboardRepo dashboardRepo;

  Future<Either<Success, Failure>> setSecretKey({
    required String secretKey,
  }) async {
    final response = await dashboardRepo.setSecretKey(
      secretKey: secretKey,
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

  Future<Either<Success, Failure>> sendMoney({
    required String email,
    required String amount,
    required String secretKey,
  }) async {
    final response = await dashboardRepo.sendMoney(
      secretKey: secretKey,
      amount: amount,
      email: email,
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

  Future<Either<Success, Failure>> requestMoney({
    required String email,
    required String amount,
    required String secretKey,
  }) async {
    final response = await dashboardRepo.requestMoney(
      secretKey: secretKey,
      amount: amount,
      email: email,
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

  Future<Either<dynamic, Failure>> findUser({
    required String email,
  }) async {
    final response = await dashboardRepo.findUser(
      email: email,
    );
    return response.fold(
      (success) {
        return Left(
          success,
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

  Future<Either<dynamic, Failure>> getRequests() async {
    final response = await dashboardRepo.getRequests();
    return response.fold(
      (success) {
        return Left(success);
      },
      (r) {
        return Right(r);
      },
    );
  }

  Future<Either<dynamic, Failure>> getProfile() async {
    final response = await dashboardRepo.getProfile();
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

  Future<Either<dynamic, Failure>> acceptMoney({
    required String requestID,
    required String secretKey,
  }) async {
    final response = await dashboardRepo.acceptMoney(
      requestID: requestID,
      secretKey: secretKey
    );
    return response.fold(
      (success) {
        return Left(
          success,
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
