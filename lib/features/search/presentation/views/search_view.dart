import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/search/domain/repos/search_books_repo.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/widget/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(getIt.get<SearchBooksRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
