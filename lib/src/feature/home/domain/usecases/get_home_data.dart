import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:river_pod_demo/src/core/http_service/data_response.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/home_model.dart';
import '../respository/home_repository.dart';


abstract class GetUserHomeCase<Type> {
  Future<Either<Failure, List<HomeModel>?>> call();
  Future<Either<Failure, HomeModel>> getNotes(int id);
}

class GetUserHomeData implements GetUserHomeCase<int> {
  final HomeRepository repository;

  GetUserHomeData(this.repository);

  @override
  Future<Either<Failure, List<HomeModel>?>> call() async {
    final result = await repository.getHomeData();
    if (result?.data != null) {
      return Right(result!.data);
    } else {
      return Left(ServerFailure(
        code: result?.statusCode ?? 500, // Default to 500 if statusCode is null
        message: result?.message ?? "Unknown error",
      ));
    }
  }

  @override
  Future<Either<Failure, HomeModel>> getNotes(int id) async {
    final result = await repository.getNote(id);
    if (result?.data != null) {
      return Right(result!.data!);
    } else {
      return Left(ServerFailure(
        code: result?.statusCode ?? 500, // Default to 500 if statusCode is null
        message: result?.message ?? "Unknown error",
      ));
    }
  }
}
