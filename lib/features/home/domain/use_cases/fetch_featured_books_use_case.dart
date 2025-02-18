import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // check permission  => use use cases
    return homeRepo.fetchFeaturedBooks();
  }
}
