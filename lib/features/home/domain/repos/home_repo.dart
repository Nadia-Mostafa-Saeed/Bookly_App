import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entitites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0});
}
