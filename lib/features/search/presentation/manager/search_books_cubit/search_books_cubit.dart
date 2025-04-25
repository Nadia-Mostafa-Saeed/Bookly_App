import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_books_repo.dart';
import 'package:meta/meta.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBooksRepo) : super(SearchBooksInitial());

  final SearchBooksRepo searchBooksRepo;
  bool loading = false;

  Future<void> fetchSearchBooks({required String search}) async {
    print('==========================$search');
    emit(SearchBooksInitial());
    loading = true;
    emit(SearchBooksLoading());
    var result = await searchBooksRepo.fetchSearchBooks(search: search);

    result.fold((failure) {
      loading = false;
      emit(SearchBooksFailure(failure.message));
    }, (books) {
      loading = false;
      emit(SearchBooksSuccess(books));
    });
  }
}
