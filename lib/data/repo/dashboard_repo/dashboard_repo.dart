import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

mixin DashboardRepo {
  Future<Either<dynamic, Failure>> setSecretKey({
    required String secretKey,
  });

  Future<Either<dynamic, Failure>> sendMoney({
    required String email,
    required String amount,
    required String secretKey,
  });

  Future<Either<dynamic, Failure>> requestMoney({
    required String email,
    required String amount,
    required String secretKey,
  });

  Future<Either<dynamic, Failure>> findUser({
    required String email,
  });

  Future<Either<dynamic, Failure>> getRequests();

  Future<Either<dynamic, Failure>> getProfile();

  Future<Either<dynamic, Failure>> acceptMoney({
    required String requestID,
    required String secretKey,
  });
}
