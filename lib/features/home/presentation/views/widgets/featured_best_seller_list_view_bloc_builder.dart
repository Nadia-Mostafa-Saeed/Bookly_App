import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBestSellerListViewBlocBuilder extends StatelessWidget {
  const FeaturedBestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return FeaturedBestSellerListView(
            books: state.books,
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
