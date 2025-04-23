import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/functions/build_error_snack_bar.dart';
import 'package:bookly_app/features/book%20details/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/book%20details/presentaion/views/widget/similar_books_list_view_loading_indicator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          if (state.books.isEmpty) {
            return buildErrorSnackBar('No Similar Books Found');
          }
          return similarBooksItemSuccess(context, books);
        } else if (state is SimilarBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return SimilarBooksListViewLoadingIndicator();
        }
      },
    );
  }

  Widget similarBooksItemSuccess(BuildContext context, List<BookEntity> books) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .15,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kBookDetailsView, extra: books[index]);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                image: books[index].image ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}
