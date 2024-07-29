import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class AuthUseCase {
  AuthUseCase({
    required this.authRepo,
  });

  final AuthRepo authRepo;

  Future<Either<Success, Failure>> login({
    required String email,
    required String password,
  }) async {
    final response = await authRepo.login(
      email: email,
      password: password,
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

  Future<Either<Success, Failure>> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await authRepo.signUp(
      email: email,
      password: password,
      username: username,
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

  Future<Either<Success, Failure>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    final response = await authRepo.verifyOTP(
      email: email,
      otp: otp,
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

  Future<Either<Success, Failure>> getProfile() async {
    final response = await authRepo.getProfile();
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
