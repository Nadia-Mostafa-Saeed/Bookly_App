import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/book%20details/domain/repos/similar_books_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SimilarBooksRepoImpl implements SimilarBooksRepo {
  final ApiService apiService;

  SimilarBooksRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {String category = "all"}) async {
    try {
      var response = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=$category&Sorting=relevance');
      //volumes?Filtering=free-ebooks&q=subject:Computers&Sorting=revelance
      //List<dynamic> booksFromApi = response['items'];

      List<BookEntity> similarBooks = [];

      for (var bookMap in response['items']) {
        similarBooks.add(BookModel.fromJson(bookMap).toEntity());
      }
      saveBooksData(similarBooks, kSimilarBox);
      return right(similarBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
