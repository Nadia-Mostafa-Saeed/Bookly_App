import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/book%20details/domain/repos/similar_books_repo.dart';
import 'package:bookly_app/features/book%20details/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/book%20details/presentaion/views/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SimilarBooksCubit(
          getIt.get<SimilarBooksRepo>(),
        )..fetchSimilarBooks(category: book.category ?? 'Computer');
      },
      child: SafeArea(
        child: Scaffold(
          body: BookDetailsViewBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
