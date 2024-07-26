import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  @override
  Future<Either<Success, Failure>> login({
    required String email,
    required String password,
  }) async {
    final response = await networkHelper.post(
      endPoints.getLoginEndPoint(),
      body: {
        "email": email,
        "password": password,
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
  Future<Either<Success, Failure>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await networkHelper.post(
      endPoints.getSignUpEndPoint(),
      body: {
        "username" : username,
        "email" : email ,
        "password" : password
      }
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
}
