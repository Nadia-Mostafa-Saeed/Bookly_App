import 'package:bookly_app/features/home/presentation/views/widgets/featured_best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/widget/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocConsumer extends StatefulWidget {
  const SearchResultListViewBlocConsumer({super.key});

  @override
  State<SearchResultListViewBlocConsumer> createState() =>
      _SearchResultListViewBlocConsumerState();
}

class _SearchResultListViewBlocConsumerState
    extends State<SearchResultListViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return FeaturedBestSellerListView(
            books: state.books,
          );
        } else if (state is SearchBooksFailure) {
          return Text(state.errorMessage);
        } else if (state is SearchBooksInitial) {
          return SearchResultView();
        } else {
          return NewestBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
