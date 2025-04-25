part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksFailure extends SearchBooksState {
  final String errorMessage;

  SearchBooksFailure(this.errorMessage);
}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}
