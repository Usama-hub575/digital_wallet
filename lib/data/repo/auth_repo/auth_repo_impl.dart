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
  Future? saveString({
    required String key,
    String? value,
  }) =>
      storage.saveString(
        key: key,
        value: value ?? '',
      );

  @override
  String? getString({required String key}) => storage.getString(
        key: key,
      );

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
        final encoded = jsonDecode(success);
        saveString(
          key: StorageKeys.accessToken,
          value: encoded['access'],
        );
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
        "username": username,
        "email": email,
        "password": password,
      },
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(success);
        saveString(
          key: StorageKeys.accessToken,
          value: decodedResponse['Token'],
        );
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
  Future<Either<Success, Failure>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    final response = await networkHelper.post(
      endPoints.getVerifyOTPEndPoint(),
      body: {
        "email": email,
        "otp": otp,
        "token": getString(
          key: StorageKeys.accessToken,
        ),
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
  Future<Either<dynamic, Failure>> getProfile() async {
    final response = await networkHelper.get(
      endPoints.getProfileEndPoint(),
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
  Future<Either<dynamic, Failure>> forgetPassword({
    required String email,
  }) async {
    final response = await networkHelper.post(
      endPoints.getForgetPasswordEndPoint(),
      body: {
        "email": email,
      },
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(
          success,
        );
        saveString(
          key: StorageKeys.forgetPasswordToken,
          value: decodedResponse['token'],
        );
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
  Future<Either<dynamic, Failure>> resetPassword({
    required String newPassword,
    required String otp,
  }) async {
    final response = await networkHelper.post(
      endPoints.getResetPasswordEndPoint(),
      modifyHeader: false,
      headers: {
        "Content-Type": "application/json",
      },
      body: {
        "token": getString(
          key: StorageKeys.forgetPasswordToken,
        ),
        "otp": otp,
        "new_password": newPassword,
      },
    );
    return response.fold(
      (success) {
        final decodedResponse = jsonDecode(
          success,
        );
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
