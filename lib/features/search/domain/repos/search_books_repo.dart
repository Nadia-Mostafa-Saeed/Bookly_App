import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBooksRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks(
      {String search = "general"});
}
