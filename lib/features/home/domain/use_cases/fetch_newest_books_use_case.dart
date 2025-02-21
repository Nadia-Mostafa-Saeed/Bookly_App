import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call({NoParam? param}) async {
    return await homeRepo.fetchNewestBooks();
  }
}
