import 'package:bookly_app/features/book%20details/domain/repos/similar_books_repo.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksRepo) : super(SimilarBooksInitial());

  final SimilarBooksRepo similarBooksRepo;
  bool loading = false;

  Future<void> fetchSimilarBooks({required String category}) async {
    loading = true;
    emit(SimilarBooksLoading());
    var result = await similarBooksRepo.fetchSimilarBooks(category: category);

    result.fold((failure) {
      loading = false;
      emit(SimilarBooksFailure(failure.message));
    }, (books) {
      loading = false;
      emit(SimilarBooksSuccess(books));
    });
  }
}
