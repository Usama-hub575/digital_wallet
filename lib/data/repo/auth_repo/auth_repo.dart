import 'package:dartz/dartz.dart';
import 'package:digital_wallet/export.dart';

mixin AuthRepo {
  Future<Either<Success, Failure>> login();
}
