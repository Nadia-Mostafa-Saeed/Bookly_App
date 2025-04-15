import 'package:bookly_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBestSellerListViewBlocBuilder extends StatefulWidget {
  const FeaturedBestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBestSellerListViewBlocBuilder> createState() =>
      _FeaturedBestSellerListViewBlocBuilderState();
}

class _FeaturedBestSellerListViewBlocBuilderState
    extends State<FeaturedBestSellerListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading) {
          return FeaturedBestSellerListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
