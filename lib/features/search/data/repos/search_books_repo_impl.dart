import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_books_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchBooksRepoImpl extends SearchBooksRepo {
  final ApiService apiService;

  SearchBooksRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks(
      {String search = "general"}) async {
    try {
      var response = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:$search');

      List<BookEntity> searchBooks = [];

      for (var books in response['items']) {
        searchBooks.add(BookModel.fromJson(books).toEntity());
      }
      saveBooksData(searchBooks, kSearchBox);
      return right(searchBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
