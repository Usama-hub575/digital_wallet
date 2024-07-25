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
  Future<Either<Success, Failure>> login() async {
    return Left(
      Success(),
    );
  }
}
