import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

mixin AuthRepo {
  Future<Either<Success, Failure>> login({
    required String email,
    required String password,
  });

  Future<Either<Success, Failure>> signUp({
    required String username,
    required String email,
    required String password,
  });
}
